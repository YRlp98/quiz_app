import 'package:flutter/material.dart';

import '../services/database.dart';
import '../theme/colors.dart';
import '../theme/icons.dart';
import '../theme/strings.dart';
import '../theme/text_style.dart';
import '../widgets/button_widgets.dart';
import '../widgets/loading_widgets.dart';
import '../widgets/text_field_widgets.dart';

class AddQuestionsPage extends StatefulWidget {
  final String quizId;

  AddQuestionsPage({
    Key key,
    @required this.quizId,
  }) : super(key: key);

  @override
  _AddQuestionsPageState createState() => _AddQuestionsPageState();
}

class _AddQuestionsPageState extends State<AddQuestionsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  DataBaseService dataBaseService = new DataBaseService();

  TextEditingController questionController,
      answer1Controller,
      answer2Controller,
      answer3Controller,
      answer4Controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* Appbar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          addQuestionTextEn,
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
                  _isLoading
                      ? CircularLoadingWidget()
                      : Form(
                          key: _formKey,
                          child: Container(
                            child: Column(
                              children: [
                                // Question
                                TextFormFiledWidget(
                                  hint: questionTextEn,
                                  errorMessage: emptyEmailErrorTextEn,
                                  textEditingController: questionController,
                                ),
                                SizedBox(height: 30),
                                // Answer 1
                                TextFormFiledWidget(
                                  hint: answer1TextEn,
                                  errorMessage: emptyEmailErrorTextEn,
                                  textEditingController: answer1Controller,
                                ),
                                SizedBox(height: 10),
                                // Answer 2
                                TextFormFiledWidget(
                                  hint: answerTextEn + ' 2',
                                  errorMessage: emptyEmailErrorTextEn,
                                  textEditingController: answer2Controller,
                                ),
                                SizedBox(height: 10),
                                // Answer 3
                                TextFormFiledWidget(
                                  hint: answerTextEn + ' 3',
                                  errorMessage: emptyEmailErrorTextEn,
                                  textEditingController: answer3Controller,
                                ),
                                SizedBox(height: 10),
                                // Answer 4
                                TextFormFiledWidget(
                                  hint: answerTextEn + ' 4',
                                  errorMessage: emptyEmailErrorTextEn,
                                  textEditingController: answer4Controller,
                                ),
                                SizedBox(height: 20),
                                // Buttons
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Left button - Back
                                    SmallButtonWidget(
                                      icon: arrowLeftCircleIcon,
                                      radius: 5,
                                      iconColor: whiteColor,
                                      backgroundColor: darkGreenColor,
                                      height: 50,
                                      width: 50,
                                      btnOnTap: null,
                                    ),
                                    // Center button - Submit
                                    Expanded(
                                      child: MediumButtonWidget(
                                        text: submitTextEn,
                                        color: greenColor,
                                        radius: 5,
                                        height: 50,
                                        btnOnTap: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                    // Right button -
                                    SmallButtonWidget(
                                      icon: arrowRightCircleIcon,
                                      radius: 5,
                                      iconColor: whiteColor,
                                      backgroundColor: darkGreenColor,
                                      height: 50,
                                      width: 50,
                                      btnOnTap: uploadQuestionData,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 25),
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

  uploadQuestionData() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      Map<String, String> questionMap = {
        'quiestion': questionController.text,
        'answer1': answer1Controller.text,
        'answer2': answer2Controller.text,
        'answer3': answer3Controller.text,
        'answer4': answer4Controller.text,
      };

      dataBaseService.addQuestionData(questionMap, widget.quizId).then((value) {
        _isLoading = false;
      });
    }
  }
}
