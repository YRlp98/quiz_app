// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/helper/helperFunctions.dart';
import 'package:quiz_app/pages/main_page.dart';

import 'pages/sign_in_page.dart';
import 'theme/colors.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkUserLoggedInStatus();
  }

  // To check user is logged in or not
  checkUserLoggedInStatus() async {
    HelperFunctions.getUserLoggedInDetails().then((value) {
      setState(() {
        _isLoggedIn = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz app',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: (_isLoggedIn ?? false) ? MainPage() : SignInPage(),
    );
  }
}
