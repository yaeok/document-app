import 'package:flutter/material.dart';

class DetMemoView extends StatefulWidget {
  const DetMemoView({super.key, required this.content});

  final String content;

  @override
  State<DetMemoView> createState() => _DetMemoViewState();
}

class _DetMemoViewState extends State<DetMemoView> {
  bool isEdit = false;

  void _editMemo() {
    setState(() {
      isEdit = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('メモ詳細'),
        actions: [
          if (!isEdit)
            IconButton(
              onPressed: _editMemo,
              icon: const Icon(Icons.edit),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isEdit
            ? _EditMemoView(content: widget.content)
            : _ShowMemoView(content: widget.content),
      ),
    );
  }
}

// 表示widget
class _ShowMemoView extends StatelessWidget {
  const _ShowMemoView({required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(content),
      ],
    );
  }
}

// 更新widget
class _EditMemoView extends StatefulWidget {
  const _EditMemoView({required this.content});

  final String content;

  @override
  State<_EditMemoView> createState() => _EditMemoViewState();
}

class _EditMemoViewState extends State<_EditMemoView> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.content);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: const InputDecoration(labelText: 'メモ内容'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, _controller.text);
          },
          child: const Text('更新'),
        ),
      ],
    );
  }
}
