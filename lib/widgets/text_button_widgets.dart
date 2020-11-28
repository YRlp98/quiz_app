import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Widget widget;

  const TextButtonWidget({
    Key key,
    @required this.text,
    this.widget,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Text(
          text,
          style: textStyle,
        ),
      ),
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => widget,
          ),
        );
        print('TEXT BUTTON WIDGET');
      },
    );
  }
}
