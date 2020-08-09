import 'package:bptest_app/components/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bptest_app/firebaseStuff/database_functions.dart';
import 'package:provider/provider.dart';
import 'message_bubble.dart';

class MessageStream extends StatelessWidget {

  final DatabaseService _dbService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<QuerySnapshot>(
      stream: _dbService.chatMessagesCollection.orderBy('Time', descending: true).snapshots(),
        builder: (context, snapshot) {
        final messages = snapshot.data.documents;

        List<MessageBubble> messageBubbles = [];
        for (var message in messages) {
          final messageText = message.data['Text'];
          final messageSender = message.data['Sender'];

          final currentUser = user.email;

          final messageBubble = MessageBubble(
            sender: messageSender,
            text: messageText,
            isMe: currentUser == messageSender,
          );

          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageBubbles,
          ),
        );
        }
    );
  }
}
