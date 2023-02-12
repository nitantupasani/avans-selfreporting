// ignore_for_file: prefer_const_constructors
import 'package:brains4buildings/screens/home/screen1.dart';
import 'package:brains4buildings/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../globals.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  String user_name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Brains4Buildings'),
        backgroundColor: Colors.green[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(80, 20, 80, 0),
              child: Image(
                image: AssetImage('images/b4b.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 40, 80, 0),
              child: Text(
                'Sign in to your account',
                style: TextStyle(color: Colors.black, fontSize: 40),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 20, 30, 0),
              child: TextFormField(
                onChanged: (val) {
                  setState(() {
                    user_name = val;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'username',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: ElevatedButton(
                  child: Text('Sign in'),
                  style: ElevatedButton.styleFrom(primary: Colors.green[800]),
                  onPressed: user_name != ''
                      ? () async {
                          final prefs = await SharedPreferences.getInstance();
                          username = user_name;
                          await prefs.setString('USERNAME', user_name);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ScreenOne()));
                          dynamic result = await _auth.signInAnon();
                          if (result == null) {
                            print('error signing in');
                          } else {
                            unique_identification = result.uid;
                          }
                        }
                      : null),
            ),
          ],
        ),
      ),
    );
  }
}
