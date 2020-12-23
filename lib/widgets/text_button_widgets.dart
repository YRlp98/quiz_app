import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Function onTap;

  const TextButtonWidget({
    Key key,
    @required this.text,
    this.textStyle,
    this.onTap,
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
        onTap();
        print('TEXT BUTTON WIDGET');
      },
    );
  }
}
