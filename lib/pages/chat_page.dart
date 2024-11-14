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
            Center(
                child: Text('Scholar Chat',
                    style: TextStyle(color: Colors.white))),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return ChatBuble();
            }),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Send a message',
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.send,
                    color: KprimaryColor,
                  ),
                  onPressed: () {},
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: KprimaryColor),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
