import 'package:flutter/material.dart';
import '../styles/custom_styles.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final String sender; // 'user' or 'bot'
  final String imageUrl;

  ChatMessage({required this.text, required this.sender, this.imageUrl = ''});

  @override
  Widget build(BuildContext context) {
    final maxMessageWidth = MediaQuery.of(context).size.width * 0.6; // 60% of the screen width

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (sender == 'user') ...[
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                child: Text('Tú', style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.blue,
                radius: 20.0,
              ),
            ),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: sender == 'user'
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
              children: <Widget>[
                Text(sender == 'user' ? 'Tú' : 'Bot', style: CustomStyles.usernameTextStyle),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  constraints: BoxConstraints(
                    maxWidth: maxMessageWidth,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(text, style: CustomStyles.messageTextStyle),
                      if (imageUrl.isNotEmpty) SizedBox(height: 10.0),
                      if (imageUrl.isNotEmpty) Image.network(imageUrl),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (sender == 'bot') ...[
            Container(
              margin: const EdgeInsets.only(left: 16.0),
              child: CircleAvatar(
                child: Text('Bot', style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.green, // Color para el icono del bot
                radius: 20.0,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
