import 'package:flutter/material.dart';
import '../widgets/chat_message.dart';
import '../widgets/message_input.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [];
  final FocusNode _focusNode = FocusNode();

  void _handleSubmitted(String text) {
    if (text.trim().isEmpty) {
      return;
    }

    ChatMessage userMessage = ChatMessage(
      text: text,
      sender: 'user',
    );

    setState(() {
      _messages.insert(0, userMessage);
    });

    _focusNode.requestFocus(); // Volver a enfocar la caja de texto

    // Añadir un retraso para simular una respuesta del bot
    Future.delayed(Duration(seconds: 1), () {
      _handleBotResponse(text);
    });
  }

  void _handleBotResponse(String userMessage) {
    ChatMessage botMessage;

    if (userMessage.toLowerCase().contains("i don't know what, but i feel it coming")) {
      botMessage = ChatMessage(
        text: "Might be so sad, might leave my nose running",
        sender: 'bot',
        imageUrl: 'https://media1.giphy.com/media/jVWd3jz8iisUM/giphy.gif',
      );
    } else {
      // Respuesta predeterminada del bot
      botMessage = ChatMessage(
        text: "Something bad is 'bout to happen to me",
        sender: 'bot',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQI89k8v4mUaEOl1LqYDL5Ayry9PYt_8mavPQ&s',
      );
    }

    setState(() {
      _messages.insert(0, botMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: MessageInput(onSubmitted: _handleSubmitted, focusNode: _focusNode),
          ),
        ],
      ),
    );
  }
}
