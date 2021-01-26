import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

//* Image
class ImageWidget extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final Color color;

  const ImageWidget({
    Key key,
    @required this.image,
    this.height,
    this.width,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
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

//* Radius Image
class RadiusImageWidget extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final double radius;
  final Color color;

  const RadiusImageWidget({
    Key key,
    @required this.image,
    @required this.radius,
    this.height,
    this.width,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        width: width,
        height: height,
        color: color,
        child: Image.asset(
          image,
        ),
      ),
    );
  }
}
