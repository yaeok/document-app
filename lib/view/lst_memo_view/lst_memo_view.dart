import 'package:document_app/model/memo.dart';
import 'package:document_app/view/det_memo_view/det_memo_view.dart';
import 'package:document_app/view/reg_memo_view/reg_memo_view.dart';
import 'package:flutter/material.dart';

class LstMemoView extends StatefulWidget {
  const LstMemoView({super.key, required this.title});
  final String title;

  @override
  State<LstMemoView> createState() => _LstMemoViewState();
}

class _LstMemoViewState extends State<LstMemoView> {
  List<Memo> lstMemos = [];

  void _incrementCounter() async {
    final Memo? newMemo = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegMemoView(),
      ),
    );
    if (newMemo == null) {
      return;
    }
    setState(() {
      newMemo.id = lstMemos.length;
      lstMemos.add(newMemo);
    });
  }

  void _transitToDetMemoView(int index) async {
    final Memo? updMemo = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetMemoView(recMemo: lstMemos[index]),
      ),
    );
    if (updMemo == null) {
      return;
    }
    setState(() {
      lstMemos = lstMemos.map((memo) {
        if (memo.id == updMemo.id) {
          return updMemo;
        }
        return memo;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: lstMemos.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(lstMemos[index].content),
              subtitle: Text(lstMemos[index].updatedAt.toString()),
              onTap: () => _transitToDetMemoView(lstMemos[index].id),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
