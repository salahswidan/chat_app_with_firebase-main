// import 'package:chat_app_with_firebase/widget/constants.dart';

// class Messages {
//   final String messages;

//   Messages(this.messages);

//   factory Messages.fromJson(jsonData) {
//     return Messages(jsonData['messages']);
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';

class Messages {
  final String messages;
  final String id;
  Messages(this.messages,this.id);

  factory Messages.fromJson(QueryDocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Messages(data['messages'] ?? '',data['id'] ?? '');
  }
}
