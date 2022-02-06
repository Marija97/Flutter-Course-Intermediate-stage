import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/components/message_bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final textEditController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User loggedInUser;
  String messageText;

  @override
  void initState() {
    super.initState();
    initLoggedUser();
  }

  void initLoggedUser() {
    final User user = _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('messages').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                // u konacnici trebam vratit 1 Widget, a to ce tu biti Column
                // s nizom poruka sa firebasea
                List<MessageBubble> conversation = [];
                // stream prima tip Stream<QuerySnapshot<Map<String, dynamic>>>
                // a ovaj snapshot je taj tip zamotan u AsyncSnapshot<QS...>
                // QuerySnapshot je u tom slucaju spremljen kao .data
                for (var querySnapshot in snapshot.data.docs.reversed) {
                  // reversed zbog prikaza. zelim odozgo prema dolje ne obrnuto
                  // Map<String, String> message = querySnapshot.data();
                  Map message = querySnapshot.data();
                  String text = message['text'];
                  String sender = message['sender'];

                  conversation.add(MessageBubble(
                    text: text,
                    sender: sender,
                    isMe: sender == loggedInUser.email,
                  ));
                }
                return Expanded(
                  child: ListView(
                      reverse: true,
                      children: conversation,
                      padding: kSymetricalPadding),
                );
              },
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      // user message input
                      onChanged: (value) => messageText = value,
                      decoration: kMessageTextFieldDecoration,
                      controller: textEditController,
                      style: kTextFieldStyle,
                    ),
                  ),
                  TextButton(
                    child: Text('Send', style: kSendButtonTextStyle),
                    onPressed: () {
                      textEditController.clear();
                      _firestore.collection('messages').add(
                          {'text': messageText, 'sender': loggedInUser.email});
                      //.then((value) => print(value.id))
                      //.catchError((e) => print("Failed to add user: $e"));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
