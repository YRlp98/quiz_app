import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/colors.dart';
import '../theme/text_style.dart';

//* Long buton
class LongButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Widget widget;
  final Function btnOnTap;

  const LongButtonWidget({
    Key key,
    @required this.text,
    @required this.color,
    this.widget,
    this.btnOnTap,
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
        btnOnTap();
        print('LONG BUTTON');
      },
    );
  }
}

//* Icon button
class IconButtonWidget extends StatelessWidget {
  final String icon;
  final double width;
  final double height;
  final double radius;
  final Color iconColor;
  final Color backgroundColor;
  final Function btnOnTap;

  const IconButtonWidget({
    Key key,
    @required this.icon,
    @required this.radius,
    this.width,
    this.height,
    this.iconColor,
    this.backgroundColor,
    this.btnOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: lightGreyColor,
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        margin: const EdgeInsets.all(10),
        height: height,
        width: width,
        child: Container(
          padding: const EdgeInsets.all(5),
          child: SvgPicture.asset(icon),
        ),
      ),
      onTap: () {
        btnOnTap();
        print('ICON BUTTON');
      },
    );
  }
}
