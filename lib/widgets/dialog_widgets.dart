import 'package:flutter/material.dart';

import '../pages/main_page.dart';
import '../theme/colors.dart';
import '../theme/strings.dart';
import '../theme/text_style.dart';

// Result dialog
class ResultDialogWidget extends StatelessWidget {
  final String total, correct, incorrect, titleMessage;

  const ResultDialogWidget({
    Key key,
    @required this.total,
    @required this.correct,
    @required this.incorrect,
    @required this.titleMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: [
        dialogBody(context),
        dialogCircleHead(),
      ],
    );
  }

  Positioned dialogCircleHead() {
    return Positioned(
      left: 10,
      right: 10,
      child: CircleAvatar(
        backgroundColor: darkestGreyColor,
        radius: 50,
        child: RichText(
          text: TextSpan(
            text: correct,
            style: heading4GreenEnStyle,
            children: [
              TextSpan(
                text: '/',
                style: heading4GreenEnStyle,
              ),
              TextSpan(
                text: total,
                style: heading4GreenEnStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container dialogBody(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 60,
        bottom: 10,
        right: 10,
        left: 10,
      ),
      margin:
          const EdgeInsets.only(top: 50), // The space between title and circle
      decoration: BoxDecoration(
        color: whiteColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: blakColor,
            blurRadius: 100.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // To make card compact
        children: [
          // Title
          Text(
            titleMessage,
            style: paragraphDarkestGreyBoldEnStyle,
          ),
          SizedBox(height: 15),
          RichText(
            text: TextSpan(
              text: youAnswerdTextEn,
              style: paragraphDarkestGreyEnStyle,
              children: [
                TextSpan(
                  text: correct,
                  style: paragraphDarkestGreyBoldEnStyle,
                ),
                TextSpan(
                  text: ansersCorrectlyTextEn,
                  style: paragraphDarkestGreyEnStyle,
                ),
                TextSpan(
                  text: incorrect,
                  style: paragraphDarkestGreyBoldEnStyle,
                ),
                TextSpan(
                  text: answersIncorrectlyTextEn,
                  style: paragraphDarkestGreyEnStyle,
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          Align(
            alignment: Alignment.bottomRight,
            child: FlatButton(
              child: Text(
                doneTextEn,
                style: paragraphDarkestGreyBoldEnStyle,
              ),
              onPressed: () {
                print("RESULT DIALOG");
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
