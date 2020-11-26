import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final String rout;

  const TextButtonWidget({
    Key key,
    @required this.text,
    this.rout,
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
        //TODO: Rout to forget password page
        print('TEXT BUTTON WIDGET');
      },
    );
  }
}
