import 'package:bptest_app/components/message_stream.dart';
import 'package:bptest_app/components/users.dart';
import 'package:bptest_app/firebaseStuff//auth_functions.dart';
import 'package:bptest_app/firebaseStuff//database_functions.dart';
import 'package:flutter/material.dart';
import 'package:bptest_app/constants.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final AuthService _auth = AuthService();
  final DatabaseService _dbService = DatabaseService();
  final _textController = TextEditingController();

  String sender = '';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    sender = user.email;
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Text('PRODUCTS'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, 'Products');
              },
            ),
            ListTile(
              title: Text('CHAT'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, 'Chat');
              },
            ),
            ListTile(
              title: Text('LOG OUT'),
              onTap: () async {
                await _auth.logOut();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Butterflies & Petals'),
        backgroundColor: kSecondaryColor,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MessageStream(),
            Row(
              children: [
                Container(
                  width: 320.0,
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'type message here',
                    ),
                  ),
                ),
                IconButton(icon: Icon(Icons.send), onPressed: () {
                  _dbService.sendMessage(sender, _textController.text);
                  _textController.clear();
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
