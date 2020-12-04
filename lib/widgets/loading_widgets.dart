import 'package:flutter/material.dart';
import 'package:quiz_app/theme/colors.dart';

//* Circular Loading
class CircularLoadingWidget extends StatelessWidget {
  const CircularLoadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: greyColor,
      valueColor: new AlwaysStoppedAnimation<Color>(
        greenColor,
      ),
    );
  }
}
