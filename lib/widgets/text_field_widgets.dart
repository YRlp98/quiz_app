import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/icons.dart';
import '../theme/strings.dart';
import '../theme/text_style.dart';
import 'icon_widgets.dart';

//* Text field
class TextFormFiledWidget extends StatelessWidget {
  static String input;
  final String hint, label, errorMessage;
  final TextEditingController textEditingController;

  TextFormFiledWidget({
    Key key,
    @required this.hint,
    @required this.errorMessage,
    @required this.textEditingController,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        return value.isEmpty ? errorMessage : null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: greyColor,
          ),
        ),
        hintText: hint,
        hintStyle: hintEnStyle,
        labelText: label,
        labelStyle: hintEnStyle,
      ),
      controller: textEditingController,
      onChanged: (value) {
        input = value;
      },
    );
  }
}

//* Password text filed
class PasswordTextFormFiledWidget extends StatefulWidget {
  final String label;

  PasswordTextFormFiledWidget({
    Key key,
    @required this.label,
  }) : super(key: key);

  @override
  PasswordTextFormFiledWidgetState createState() =>
      PasswordTextFormFiledWidgetState();
}

class PasswordTextFormFiledWidgetState
    extends State<PasswordTextFormFiledWidget> {
  bool _showPassword = false;
  static String password;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !_showPassword,
      validator: (value) {
        return value.isEmpty ? emptyPasswordErrorTextEn : null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: greyColor,
          ),
        ),
        hintText: passwordTextEn,
        hintStyle: hintEnStyle,
        labelText: widget.label,
        labelStyle: hintEnStyle,
        suffixIcon: GestureDetector(
          child: _showPassword
              ? TextFieldSVGIconsWidget(icon: showIcon)
              : TextFieldSVGIconsWidget(icon: hideIcon),
          onTap: () {
            setState(() {
              _showPassword = !_showPassword;
            });
          },
        ),
      ),
      onChanged: (value) {
        password = value;
      },
    );
  }
}
