import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/images.dart';
import '../theme/strings.dart';
import '../theme/text_style.dart';
import '../widgets/button_widgets.dart';
import '../widgets/image_widgets.dart';
import '../widgets/text_button_widgets.dart';
import '../widgets/text_field_widgets.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

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
                  Form(
                    key: _formKey,
                    child: Container(
                      child: Column(
                        children: [
                          // Login title
                          registerTitle(),
                          SizedBox(height: 20),
                          // Name text field
                          NameTextFormFiledWidget(),
                          SizedBox(height: 10),
                          // Email text field
                          EmailTextFormFiledWidget(),
                          SizedBox(height: 10),
                          // password text field
                          PasswordTextFormFiled(),
                          SizedBox(height: 20),
                          // Login Button
                          LongButtonWidget(
                            text: signUpTextEn,
                            color: greenColor,
                          ),
                          SizedBox(height: 25),
                          // Register now
                          registerNow(),
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

  Row registerNow() {
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
}
