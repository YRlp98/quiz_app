import 'package:flutter/material.dart';

import '../helper/helperFunctions.dart';
import '../services/auth.dart';
import '../theme/colors.dart';
import '../widgets/button_widgets.dart';
import 'sign_in_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  AuthService authService = new AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: LongButtonWidget(
        text: 'Logout',
        color: greenColor,
        btnOnTap: signOut,
      ),
    );
  }

  signOut() {
    // Login-out and naviage to sign-in page
    authService.signOut().then((value) {
      // Save user is logged-out
      HelperFunctions.saveUserLoggedInDetals(isLoggedIn: false);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SignInPage(),
        ),
      );
    });
  }
}
