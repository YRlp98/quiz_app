import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/icons.dart';
import '../theme/strings.dart';
import '../theme/text_style.dart';
import 'icon_widgets.dart';

//* Email text filed
class EmailTextFormFiledWidget extends StatelessWidget {
  String email;

  EmailTextFormFiledWidget({
    Key key,
    this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        return value.isEmpty ? emptyEmailErrorTextEn : null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: greyColor,
          ),
        ),
        hintText: emailTextEn,
        hintStyle: hintEnStyle,
      ),
      onChanged: (value) {
        email = value;
        print('EMAIL: ' + email);
      },
    );
  }
}

//* Name text filed
class NameTextFormFiledWidget extends StatelessWidget {
  String name;

  NameTextFormFiledWidget({
    Key key,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        return value.isEmpty ? emptyEmailErrorTextEn : null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: greyColor,
          ),
        ),
        hintText: nameTextEn,
        hintStyle: hintEnStyle,
      ),
      onChanged: (value) {
        name = value;
        print('EMAIL: ' + name);
      },
    );
  }
}

//* Password text filed
class PasswordTextFormFiled extends StatefulWidget {
  PasswordTextFormFiled({
    Key key,
  }) : super(key: key);

  @override
  _PasswordTextFormFiledState createState() => _PasswordTextFormFiledState();
}

class _PasswordTextFormFiledState extends State<PasswordTextFormFiled> {
  bool _showPassword = false;
  String password;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !_showPassword,
      validator: (value) {
        return value.isEmpty ? emptyEmailErrorTextEn : null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: greyColor,
          ),
        ),
        hintText: passwordTextEn,
        hintStyle: hintEnStyle,
        suffixIcon: GestureDetector(
          child: _showPassword
              ? TextFieldSVGIconsWidgets(icon: showIcon)
              : TextFieldSVGIconsWidgets(icon: hideIcon),
          onTap: () {
            setState(() {
              _showPassword = !_showPassword;
            });
          },
        ),
      ),
      onChanged: (value) {
        password = value;
        print('PASSWORD: ' + password);
      },
    );
  }
}
