import 'package:flutter/material.dart';

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
      home: SignIn(),
    );
  }
}
