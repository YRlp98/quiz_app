import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/button_widgets.dart';
import 'package:quiz_app/widgets/text_button_widgets.dart';

import '../theme/colors.dart';
import '../theme/images.dart';
import '../theme/strings.dart';
import '../theme/text_style.dart';
import '../widgets/image_widgets.dart';
import '../widgets/text_field_widgets.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                  //* Login widgets
                  Form(
                    key: _formKey,
                    child: Container(
                      child: Column(
                        children: [
                          // Login title
                          loginTitle(),
                          SizedBox(height: 20),
                          // Email text field
                          EmailTextFormFiledWidget(),
                          SizedBox(height: 10),
                          // password text field
                          PasswordTextFormFiled(),
                          SizedBox(height: 10),
                          // Forget password
                          forgetPassword(),
                          SizedBox(height: 20),
                          // Login Button
                          LongButtonWidget(
                            text: signInTextEn,
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
          dontHaveAccountTextEn,
          style: textButtonBigEnStyle,
        ),
        TextButtonWidget(
          text: registerNowTextEn,
          textStyle: textButtonBigBoldGreenEnStyle,
        ),
      ],
    );
  }

  Align forgetPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButtonWidget(
        text: forgetPwTextEn,
        rout: '',
        textStyle: textButtonBigEnStyle,
      ),
    );
  }

  Align loginTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        loginTitleTextEn,
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
