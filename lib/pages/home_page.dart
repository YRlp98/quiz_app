import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/icons.dart';
import '../theme/images.dart';
import '../theme/strings.dart';
import '../theme/text_style.dart';
import '../widgets/button_widgets.dart';
import '../widgets/image_widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: appbarAvatar(),
        title: appbarTexts(),
        actions: [
          appbarNotificationsIcon(),
          SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: 400,
          height: 400,
          color: Colors.amber,
          child: Text('BODY'),
        ),
      ),
    );
  }

  IconButtonWidget appbarNotificationsIcon() {
    return IconButtonWidget(
      icon: notificationstiIcon,
      height: 33,
      width: 33,
      radius: 10,
      backgroundColor: whiteColor,
      iconColor: blakColor,
      btnOnTap: () {},
    );
  }

  Column appbarTexts() {
    return Column(
      children: [
        // TODO: DIsplay the user's name
        // Hello text
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            helloTextEn,
            style: heading4BlackEnStyle,
          ),
        ),
        // Start quiz message
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            letsStartQuizTextEn,
            style: heaing6BlackEnStyle,
          ),
        ),
      ],
    );
  }

  Padding appbarAvatar() {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: RadiusImageWidget(
        // TODO: Display the user's avatar
        image: avatar,
        radius: 15,
        width: 54,
        height: 54,
      ),
    );
  }
}
