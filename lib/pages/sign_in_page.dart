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
import 'sign_up_page.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  AuthServvice authServvice = new AuthServvice();
  TextEditingController emailController;

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
                  _isLoading
                      ? Container(
                          // Loading
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
                                loginTitle(),
                                SizedBox(height: 20),
                                // Email text field
                                TextFormFiledWidget(
                                  hint: emailTextEn,
                                  errorMessage: emptyEmailErrorTextEn,
                                  textEditingController: emailController,
                                ),
                                SizedBox(height: 10),
                                // password text field
                                PasswordTextFormFiledWidget(),
                                SizedBox(height: 10),
                                // Forget password
                                forgetPassword(),
                                SizedBox(height: 20),
                                // Login Button
                                LongButtonWidget(
                                  text: signInTextEn,
                                  color: greenColor,
                                  btnOnTap: signIn,
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
          widget: SignUpPage(),
        ),
      ],
    );
  }

  Align forgetPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButtonWidget(
        text: forgetPwTextEn,
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

  signIn() {
    // T0 check user entered the validate inputs
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Login and naviage to home page
      authServvice
          .signInEmailAndPass(TextFormFiledWidget.input,
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
