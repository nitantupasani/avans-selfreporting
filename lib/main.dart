import 'package:brains4buildings/globals.dart';
import 'package:brains4buildings/screens/authenticate/sign_in.dart';
import 'package:brains4buildings/screens/wrapper.dart';
import 'package:brains4buildings/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  username = prefs.getString('USERNAME') ?? '';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return StreamProvider<OurUser?>.value(
    //   initialData: null,
    //   value: null,
    //   child: MaterialApp(
    //     home: SignIn(),
    //   ),
    // );

    return StreamProvider<OurUser?>.value(
      catchError: (_, __) => null,
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
