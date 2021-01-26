import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/colors.dart';
import '../theme/text_style.dart';
import 'icon_widgets.dart';

//* Long buton with icon
class LongButtonWithIconWidget extends StatelessWidget {
  final String text, icon;
  final Color color, iconColor;
  final TextStyle buttonTextStyle;
  final Widget widget;
  final Function btnOnTap;
  final double height;

  const LongButtonWithIconWidget({
    Key key,
    @required this.text,
    @required this.icon,
    @required this.color,
    @required this.buttonTextStyle,
    @required this.iconColor,
    this.widget,
    this.btnOnTap,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 15),
        height: 52,
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text
            Text(
              text,
              style: buttonTextStyle,
            ),
            // Icon
            SVGIconWidget(
              icon: icon,
              color: iconColor,
            ),
          ],
        ),
      ),
      onTap: () {
        btnOnTap();
        print('LONG BUTTON WITH ICON');
      },
    );
  }
}

//* Long buton
class LongButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Widget widget;
  final Function btnOnTap;
  final double height;

  const LongButtonWidget({
    Key key,
    @required this.text,
    @required this.color,
    this.widget,
    this.btnOnTap,
    this.height,
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
          style: buttonLightEnStyle,
        ),
      ),
      onTap: () {
        btnOnTap();
        print('LONG BUTTON');
      },
    );
  }
}

//* Medium buton
class MediumButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Function btnOnTap;
  final double height, width, radius;

  const MediumButtonWidget({
    Key key,
    @required this.text,
    @required this.color,
    @required this.radius,
    this.btnOnTap,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: buttonLightEnStyle,
        ),
      ),
      onTap: () {
        btnOnTap();
        print('MEDIUM BUTTON');
      },
    );
  }
}

//* Icon button
class SmallButtonWidget extends StatelessWidget {
  final String icon;
  final double width, height, radius;
  final Color iconColor, backgroundColor;
  final Function btnOnTap;

  const SmallButtonWidget({
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
        print('SMALL BUTTON');
      },
    );
  }
}

//* Icon button
class IconButtonWidget extends StatelessWidget {
  final String icon;
  final double width, height, radius;
  final Color iconColor, backgroundColor;
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
