import 'package:flutter/material.dart';

class MessageInput extends StatelessWidget {
  final Function(String) onSubmitted;
  final TextEditingController _controller = TextEditingController();
  final FocusNode focusNode;

  MessageInput({required this.onSubmitted, required this.focusNode});

  void _handleSubmitted(String text) {
    if (text.trim().isEmpty) {
      return;
    }
    _controller.clear();
    onSubmitted(text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: _controller,
              onSubmitted: _handleSubmitted,
              focusNode: focusNode,
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message',
              ),
              style: TextStyle(color: Colors.black),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () => _handleSubmitted(_controller.text),
          ),
        ],
      ),
    );
  }
}
