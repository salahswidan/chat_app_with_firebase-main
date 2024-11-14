import 'package:chat_app_with_firebase/widget/constants.dart';
import 'package:flutter/material.dart';

import '../widget/chat_buble.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //! to hide back button
        centerTitle: true,
        backgroundColor: KprimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Klogo, width: 40, height: 40),
            Text('Scholar Chat', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      body: ChatBuble(),
    );
  }
}
