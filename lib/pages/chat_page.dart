// import 'dart:math';

// import 'package:chat_app_with_firebase/models/message.dart';
// import 'package:chat_app_with_firebase/widget/constants.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import '../widget/chat_buble.dart';

// class ChatPage extends StatelessWidget {
//   CollectionReference messages =
//       FirebaseFirestore.instance.collection(KMessagesCollection);
//   TextEditingController controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<QuerySnapshot>(
//       future: messages.get(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           List<Messages> messagesList = [];
//           for (int i = 0; i < snapshot.data!.docs.length; i++) {
//             messagesList.add(Messages.fromJson(snapshot.data!.docs[i]));
//           }

//           return Scaffold(
//             appBar: AppBar(
//               automaticallyImplyLeading: false, //! to hide back button
//               centerTitle: true,
//               backgroundColor: KprimaryColor,
//               title: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(Klogo, width: 40, height: 40),
//                   Center(
//                       child: Text('Scholar Chat',
//                           style: TextStyle(color: Colors.white))),
//                 ],
//               ),
//             ),
//             body: Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(itemBuilder: (context, index) {
//                     itemCount:
//                     messagesList.length;
//                     return ChatBuble(
//                       messages: messagesList[index],
//                     );
//                   }),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(16),
//                   child: TextField(
//                     controller: controller,
//                     onSubmitted: (data) {
//                       messages.add({
//                         'messages': data,
//                       });
//                       controller.clear();
//                     },
//                     decoration: InputDecoration(
//                       hintText: 'Send a message',
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           Icons.send,
//                           color: KprimaryColor,
//                         ),
//                         onPressed: () {},
//                       ),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(color: KprimaryColor),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         } else {
//           return Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widget/constants.dart';
import 'package:chat_app_with_firebase/models/message.dart';
import '../widget/chat_buble.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  final CollectionReference messages =
      FirebaseFirestore.instance.collection(KMessagesCollection);
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: messages.get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Messages> messagesList =
              snapshot.data!.docs.map((doc) => Messages.fromJson(doc)).toList();

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false, // Hides back button
              centerTitle: true,
              backgroundColor: KprimaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Klogo, width: 40, height: 40),
                  const Text(
                    'Scholar Chat',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return ChatBuble(message: messagesList[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      messages.add({'messages': data}); // Save to Firestore
                      controller.clear(); // Clear the text field
                    },
                    decoration: InputDecoration(
                      hintText: 'Send a message',
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.send,
                          color: KprimaryColor,
                        ),
                        onPressed: () {
                          final data = controller.text;
                          if (data.isNotEmpty) {
                            messages.add({'messages': data});
                            controller.clear();
                          }
                        },
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: KprimaryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
