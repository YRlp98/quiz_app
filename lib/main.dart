import 'package:flutter/material.dart';
import 'package:quiz_app/pages/sign_up_page.dart';

import 'pages/sign_in_page.dart';
import 'theme/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz app',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}
