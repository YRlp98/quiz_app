import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/text_style.dart';

//* SVG Icon
class SVGIconWidget extends StatelessWidget {
  final String icon;
  final Color color;
  final double height;
  final double width;

  const SVGIconWidget({
    Key key,
    @required this.icon,
    this.color,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: SvgPicture.asset(
        icon,
        color: color,
        height: height,
        width: width,
      ),
    );
  }
}

//* Text field SVG icon
class TextFieldSVGIconsWidget extends StatelessWidget {
  final String icon;
  final Color color;
  final double height;
  final double width;

  const TextFieldSVGIconsWidget({
    Key key,
    @required this.icon,
    this.color,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: SvgPicture.asset(
        icon,
        color: color,
        height: height,
        width: width,
      ),
    );
  }
}

//* SVG Icon with text
class SVGIconWithTextWidget extends StatelessWidget {
  final String icon;
  final String text;
  final Color iconColor;
  final double height;
  final double width;

  const SVGIconWithTextWidget({
    Key key,
    @required this.icon,
    @required this.text,
    this.iconColor,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(60, 1, 60, 2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon
          Container(
            margin: const EdgeInsets.all(8),
            child: SvgPicture.asset(
              icon,
              color: iconColor,
              height: height,
              width: width,
            ),
          ),
          // Text
          Text(
            text,
            style: icondarkestGreyEnStyle,
          ),
        ],
      ),
    );
  }
}
