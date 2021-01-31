import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../helper/helperFunctions.dart';
import '../services/auth.dart';
import '../theme/colors.dart';
import '../theme/icons.dart';
import '../theme/images.dart';
import '../theme/strings.dart';
import '../theme/text_style.dart';
import '../widgets/button_widgets.dart';
import '../widgets/dropdown_button_wdgets/language_drodown_widget.dart';
import '../widgets/dropdown_button_wdgets/theme_dropdown_widget.dart';
import '../widgets/image_widgets.dart';
import '../widgets/loading_widgets.dart';
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
  String userEmail;

  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    user = await _auth.currentUser();
    setState(() {
      userEmail = user.email;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            userEmail == null
                ? Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: CircularLoadingWidget(),
                  )
                : accountInfo(),
            appSettings(),
            aboutSettings(),
            supportSettings(),
            SizedBox(height: 35),
            //* Logout
            LongButtonWidget(
              text: logoutTextEn,
              color: redColor,
              btnOnTap: signOut,
            ),
          ],
        ),
      ),
    );
  }

  Container supportSettings() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 23, vertical: 7.5),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 15),
          // Title
          Text(
            supportTextEn,
            style: paragraphDarkestGreyBoldEnStyle,
          ),
          SizedBox(height: 10),
          // Feedback
          LongButtonWithIconWidget(
            text: feedbackTextEn,
            color: lightestGreyColor,
            icon: arrowRightIcon,
            iconColor: darkGreyColor,
            buttonTextStyle: buttonDarkEnStyle,
            btnOnTap: () {},
          ),
        ],
      ),
    );
  }

  Container aboutSettings() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 23, vertical: 7.5),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 15),
          // Title
          Text(
            aboutTextEn,
            style: paragraphDarkestGreyBoldEnStyle,
          ),
          SizedBox(height: 10),
          // About
          LongButtonWithIconWidget(
            text: aboutQuizAppTextEn,
            color: lightestGreyColor,
            icon: arrowRightIcon,
            iconColor: darkGreyColor,
            buttonTextStyle: buttonDarkEnStyle,
            btnOnTap: () {},
          ),
          SizedBox(height: 10),
          // Developer website
          LongButtonWithIconWidget(
            text: developerWebsiteTextEn,
            color: lightestGreyColor,
            icon: arrowRightIcon,
            iconColor: darkGreyColor,
            buttonTextStyle: buttonDarkEnStyle,
            btnOnTap: () {},
          ),
        ],
      ),
    );
  }

  Container appSettings() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 23, vertical: 7.5),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 15),
          // Title
          Text(
            appSettingsTextEn,
            style: paragraphDarkestGreyBoldEnStyle,
          ),
          SizedBox(height: 10),
          // Language
          LanguageDropDownButtonWidget(),
          SizedBox(height: 10),
          // Theme
          ThemeDropdownWidget(),
        ],
      ),
    );
  }

  Container accountInfo() {
    return Container(
      padding: const EdgeInsets.only(top: 55, bottom: 20),
      color: lightestGreyColor,
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
              userEmail,
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
