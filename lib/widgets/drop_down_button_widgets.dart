import 'package:flutter/material.dart';
import 'package:quiz_app/theme/colors.dart';
import 'package:quiz_app/theme/icons.dart';
import 'package:quiz_app/theme/strings.dart';
import 'package:quiz_app/theme/text_style.dart';

import 'icon_widgets.dart';

//* Language
class LanguageDropDownButtonWidget extends StatefulWidget {
  const LanguageDropDownButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  _LanguageDropDownButtonWidgetState createState() =>
      _LanguageDropDownButtonWidgetState();
}

class _LanguageDropDownButtonWidgetState
    extends State<LanguageDropDownButtonWidget> {
  String valueChoose;
  List listItems = [englishTextEn, persianTextEn];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
        color: lightestGreyColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton(
        hint: Text(languageTextEn),
        style: paragraphDarkestGreyEnStyle,
        iconSize: 32,
        icon: SVGIconWidget(
          icon: arrowDownIcon,
          color: halfDarkGreyColor,
        ),
        underline: SizedBox(),
        isExpanded: true,
        value: valueChoose,
        onChanged: (newValue) {
          setState(() {
            valueChoose = newValue;
          });
        },
        items: listItems.map((valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Text(valueItem),
          );
        }).toList(),
      ),
    );
  }
}

//* Theme
class ThemeDropDownButtonWidget extends StatefulWidget {
  const ThemeDropDownButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  _ThemeDropDownButtonWidgetState createState() =>
      _ThemeDropDownButtonWidgetState();
}

class _ThemeDropDownButtonWidgetState extends State<ThemeDropDownButtonWidget> {
  String valueChoose;
  List listItems = [lightTextEn, darkTextEn];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
        color: lightestGreyColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton(
        hint: Text(themeTextEn),
        style: paragraphDarkestGreyEnStyle,
        iconSize: 32,
        icon: SVGIconWidget(
          icon: arrowDownIcon,
          color: halfDarkGreyColor,
        ),
        underline: SizedBox(),
        isExpanded: true,
        value: valueChoose,
        onChanged: (newValue) {
          setState(() {
            valueChoose = newValue;
          });
        },
        items: listItems.map((valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Text(valueItem),
          );
        }).toList(),
      ),
    );
  }
}
