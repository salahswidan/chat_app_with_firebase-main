import 'package:flutter/material.dart';

import 'constants.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32),
        margin: EdgeInsets.symmetric( horizontal: 16,vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: KprimaryColor,
        ),
        child: Text("iam a new user", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
