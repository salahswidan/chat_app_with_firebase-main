import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widget/constants.dart';
import 'package:chat_app_with_firebase/models/message.dart';
import '../widget/chat_buble.dart';

class ChatPage extends StatelessWidget {
  ChatPage({
    super.key,
    required this.email,
  });

  final CollectionReference messages =
      FirebaseFirestore.instance.collection(KMessagesCollection);
  final TextEditingController controller = TextEditingController();
  final _controller = ScrollController();
  final String email;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('createdAt', descending: true).snapshots(),
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
                  Text(
                    'Scholar Chat ',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id == email
                          ? ChatBuble(message: messagesList[index])
                          : ChatBubleForFriend(message: messagesList[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      messages.add({
                        'messages': data,
                        'createdAt': DateTime.now(),
                        "id": email
                      });
                      controller.clear();
                      _controller.animateTo(
                        0, // to scroll to the bottom of the screen
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
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
