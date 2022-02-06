import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                  child: Hero(
                      tag: 'logo',
                      child: Container(
                        height: 200.0,
                        child: Image.asset('images/logo.png'),
                      ))),
              SizedBox(height: 48.0),
              TextField(
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your email',
                ),
                onChanged: (value) => email = value,
                keyboardType: TextInputType.emailAddress,
                style: kTextFieldStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.0),
              TextField(
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password.',
                ),
                onChanged: (value) => password = value,
                obscureText: true,
                style: kTextFieldStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.0),
              RoundedButton(
                title: 'Log In',
                color: Colors.lightBlueAccent,
                onPressed: () async {
                  setState(() => showSpinner = true);
                  try {
                    UserCredential uc = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    // print('${uc.user.email} has logged in');
                    Navigator.pushNamed(context, ChatScreen.id);
                  } catch (e) {
                    print(e);
                  } finally {
                    setState(() => showSpinner = false);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
