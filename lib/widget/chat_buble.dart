// import 'package:chat_app_with_firebase/models/message.dart';
// import 'package:flutter/material.dart';

// import 'constants.dart';

// class ChatBuble extends StatelessWidget {
//   const ChatBuble({super.key, required this.messages});

//  final Messages messages;

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Container(
//         padding: EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32),
//         margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(32),
//             topRight: Radius.circular(32),
//             bottomRight: Radius.circular(32),
//           ),
//           color: KprimaryColor,
//         ),
//         child: Text(messages.messages, style: TextStyle(color: Colors.white)),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:chat_app_with_firebase/models/message.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({super.key, required this.message});

  final Messages message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft, // Align the bubble to the left
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: KprimaryColor, // Bubble color
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
        child: Text(
          message.messages, // Display the message text
          style: const TextStyle(color: Colors.white), // White text color
        ),
      ),
    );
  }
}
