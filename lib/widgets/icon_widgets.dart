import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

//* Text field SVG icon
class TextFieldSVGIconsWidgets extends StatelessWidget {
  final String icon;
  final Color color;
  final double height;
  final double width;

  const TextFieldSVGIconsWidgets({
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
