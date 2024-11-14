
import 'package:flutter/material.dart';

import 'constants.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 150,
      padding: EdgeInsets.only(left: 16),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        color: KprimaryColor,
      ),
      child: Text("iam a new user", style: TextStyle(color: Colors.white)),
    );
  }
}
