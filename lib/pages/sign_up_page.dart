import 'package:flutter/material.dart';

import '../services/auth.dart';
import '../theme/colors.dart';
import '../theme/images.dart';
import '../theme/strings.dart';
import '../theme/text_style.dart';
import '../widgets/button_widgets.dart';
import '../widgets/image_widgets.dart';
import '../widgets/loading_widgets.dart';
import '../widgets/text_button_widgets.dart';
import '../widgets/text_field_widgets.dart';
import 'main_page.dart';
import 'sign_in_page.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  // String email, password;
  bool _isLoading = false;
  AuthServvice authServvice = new AuthServvice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo
                  signInPageLogo(),
                  //* Register widgets
                  _isLoading
                      // loading
                      ? Container(
                          child: Center(
                            child: CircularLoadingWidget(),
                          ),
                        )
                      : Form(
                          key: _formKey,
                          child: Container(
                            child: Column(
                              children: [
                                // Login title
                                registerTitle(),
                                SizedBox(height: 20),
                                // Name text field
                                TextFormFiledWidget(hint: nameTextEn),
                                SizedBox(height: 10),
                                // Email text field
                                TextFormFiledWidget(hint: emailTextEn),
                                SizedBox(height: 10),
                                // password text field
                                PasswordTextFormFiledWidget(),
                                SizedBox(height: 20),
                                // Login Button
                                LongButtonWidget(
                                  text: signUpTextEn,
                                  color: greenColor,
                                  btnOnTap: signUp,
                                ),
                                SizedBox(height: 25),
                                // Register now
                                loginNow(),
                                SizedBox(height: 25),
                              ],
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row loginNow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          haveaccountTextEn,
          style: textButtonBigEnStyle,
        ),
        TextButtonWidget(
          text: loginNowTextEn,
          textStyle: textButtonBigBoldGreenEnStyle,
          widget: SignInPage(),
        ),
      ],
    );
  }

  Align registerTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        registerTitleTextEn,
        style: heading1GreenEnStyle,
      ),
    );
  }

  Container signInPageLogo() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 50),
      child: SVGImageWidget(
        image: quizLogo,
        color: greenColor,
      ),
    );
  }

  signUp() {
    // T0 check user entered the validate inputs
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Sign-up and naviage to home page
      authServvice
          .signUpWithEmailandPassword(TextFormFiledWidget.input,
              PasswordTextFormFiledWidgetState.password)
          .then(
        (value) {
          if (value != null) {
            setState(() {
              _isLoading = false;
            });
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MainPage(),
              ),
            );
          }
        },
      );
    }
  }
}
