import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble({this.text, this.sender, this.isMe});
  final String text;
  final String sender;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(sender, style: kSenderTextStyle),
          Material(
            color: isMe ? Colors.blue : Colors.white,
            borderRadius: isMe ? kTopRightCorner : kTopLeftCorner,
            elevation: 5.0,
            child: Padding(
                child: Text(
                  text ?? '',
                  style: isMe ? kBubbleTextStyleW : kBubbleTextStyleB,
                ),
                padding: kSymetricalPadding),
          ),
        ],
      ),
    );
  }
}
