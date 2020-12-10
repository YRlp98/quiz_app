import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/strings.dart';
import '../theme/text_style.dart';
import '../widgets/button_widgets.dart';
import '../widgets/text_field_widgets.dart';

class CreateQuizPage extends StatefulWidget {
  CreateQuizPage({Key key}) : super(key: key);

  @override
  _CreateQuizPageState createState() => _CreateQuizPageState();
}

class _CreateQuizPageState extends State<CreateQuizPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String quizTitle, quizImageURL, quizDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* Appbar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          createQuizTextEn,
          style: heading4BlackEnStyle,
        ),
      ),
      //* Body
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                    key: _formKey,
                    child: Container(
                      child: Column(
                        children: [
                          // Title
                          TextFormFiledWidget(hint: titleTextEn),
                          SizedBox(height: 10),
                          // Image
                          TextFormFiledWidget(hint: imageURLTextEn),
                          SizedBox(height: 10),
                          // Description
                          TextFormFiledWidget(hint: descriptionTextEn),
                          SizedBox(height: 20),
                          // Button
                          LongButtonWidget(
                            text: createQuizTextEn,
                            color: greenColor,
                            btnOnTap: () {},
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
