
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final String collection = "messages";

  Stream<QuerySnapshot> getMessages() {
    return _firestore
        .collection(collection)
        .orderBy("timestamp", descending: true)
        .snapshots();
  }

  Future<void> sendMessage(String text, String sender) async {
    await _firestore.collection(collection).add({
      "text": text,
      "sender": sender,
      "timestamp": FieldValue.serverTimestamp(),
    });
  }
}