import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/theme/images.dart';
import 'package:quiz_app/theme/strings.dart';
import 'package:quiz_app/theme/text_style.dart';
import 'package:quiz_app/widgets/image_widgets.dart';

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
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    user = await _auth.currentUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            accountInfo(),
          ],
        ),
      ),
      // LongButtonWidget(
      //   text: 'Logout',
      //   color: greenColor,
      //   btnOnTap: signOut,
      // ),
    );
  }

  Container accountInfo() {
    return Container(
      padding: const EdgeInsets.only(top: 55, bottom: 20),
      color: lightGreyColor,
      child: Center(
        child: Column(
          children: <Widget>[
            // Avatar image
            RadiusImageWidget(
              image: avatar,
              height: 96,
              width: 96,
              radius: 15,
            ),
            SizedBox(height: 15),
            // Logged in messge
            Text(
              youHaveBeenLoggedInAsTextEn,
              style: paragraphDarkestGreyBoldEnStyle,
            ),
            SizedBox(height: 8),
            // Email
            Text(
              user.email,
              style: heaing6BlackEnStyle,
            ),
            SizedBox(height: 10),
          ],
        ),
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
