
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/chat_service.dart';

class ChatController {
  final ChatService _service = ChatService();

  Stream<QuerySnapshot> getMessages() {
    return _service.getMessages();
  }

  Future<void> sendMessage(String text, String sender) async {
    await _service.sendMessage(text, sender);
  }
}
