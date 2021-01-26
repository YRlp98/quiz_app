import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../theme/icons.dart';
import '../../theme/strings.dart';
import '../../theme/text_style.dart';
import '../icon_widgets.dart';

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
      padding: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 15),
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
