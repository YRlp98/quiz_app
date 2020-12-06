import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/icons.dart';
import 'icon_widgets.dart';

//* FAB Widget
class FABWidget extends StatelessWidget {
  final Function ontap;

  const FABWidget({
    Key key,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: greenColor,
      child: SVGIconWidget(
        icon: plusIcon,
        color: whiteColor,
        height: 20,
        width: 20,
      ),
      onPressed: ontap,
    );
  }
}
