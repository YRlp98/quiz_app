import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

//* Image
class ImageWidget extends StatelessWidget {
  final String image;
  final double height;
  final double width;

  const ImageWidget({
    Key key,
    @required this.image,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Image.asset(
        image,
      ),
    );
  }
}

//* SVG Image
class SVGImageWidget extends StatelessWidget {
  final String image;
  final Color color;
  final double height;
  final double width;

  const SVGImageWidget({
    Key key,
    @required this.image,
    this.color,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(
        image,
        color: color,
        height: height,
        width: width,
      ),
    );
  }
}
