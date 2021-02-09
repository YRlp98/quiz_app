import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/text_style.dart';

//* Option tile widget
class OptionTileWidget extends StatefulWidget {
  final String option, answer, correctAnser, optionSelected;

  OptionTileWidget({
    Key key,
    @required this.option,
    @required this.answer,
    @required this.correctAnser,
    @required this.optionSelected,
  }) : super(key: key);

  @override
  _OptionTileWidgetState createState() => _OptionTileWidgetState();
}

class _OptionTileWidgetState extends State<OptionTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          // Tile number
          Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: widget.optionSelected == widget.answer
                  ? widget.answer == widget.correctAnser
                      ? greenColor
                      : redColor
                  : whiteColor,
              border: Border.all(
                color: darkestGreyColor,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            alignment: Alignment.center,
            child: Text(
              widget.option,
              style: paragraphDarkestGreyEnStyle,
            ),
          ),
          SizedBox(width: 10),
          // Tile option
          Flexible(
            child: RichText(
              overflow: TextOverflow.ellipsis,
              strutStyle: StrutStyle(fontSize: 12.0),
              text: TextSpan(
                text: widget.answer,
                style: paragraphDarkestGreyEnStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
