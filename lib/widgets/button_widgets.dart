import 'package:flutter/material.dart';

import '../theme/text_style.dart';

//* Long buton
class LongButtonWidget extends StatelessWidget {
  final String text;
  final Color color;

  const LongButtonWidget({
    Key key,
    @required this.text,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: buttonEnStyle,
        ),
      ),
      onTap: () {
        print('LONG BUTTON');
      },
    );
  }
}
