import 'package:document_app/model/memo.dart';
import 'package:flutter/material.dart';

class RegMemoView extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  RegMemoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('メモ追加'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'メモ内容'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Memo newMemo = Memo(
                  id: 0,
                  content: _controller.text,
                  createdAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                );
                Navigator.pop(context, newMemo);
              },
              child: const Text('登録'),
            ),
          ],
        ),
      ),
    );
  }
}
