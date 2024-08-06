import 'package:document_app/det_memo_view/det_memo_view.dart';
import 'package:document_app/reg_memo_view/reg_memo_view.dart';
import 'package:flutter/material.dart';

class LstMemoView extends StatefulWidget {
  const LstMemoView({super.key, required this.title});
  final String title;

  @override
  State<LstMemoView> createState() => _LstMemoViewState();
}

class _LstMemoViewState extends State<LstMemoView> {
  List<String> lstMemos = [];

  void _incrementCounter() async {
    final String? newMemo = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegMemoView(),
      ),
    );
    if (newMemo == null) {
      return;
    }
    setState(() {
      lstMemos.add(newMemo);
    });
  }

  void _transitToDetMemoView(String content) async {
    final String? updMemo = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetMemoView(content: content),
      ),
    );
    if (updMemo == null) {
      return;
    }
    setState(() {
      lstMemos =
          lstMemos.map((memo) => memo == content ? updMemo : memo).toList();
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
              title: Text(lstMemos[index]),
              onTap: () => _transitToDetMemoView(lstMemos[index]),
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
