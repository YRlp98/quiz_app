import 'package:flutter/material.dart';
import 'package:quiz_app/theme/colors.dart';
import 'package:quiz_app/theme/icons.dart';
import 'package:quiz_app/theme/strings.dart';
import 'package:quiz_app/theme/text_style.dart';
import 'package:quiz_app/widgets/button_widgets.dart';
import 'package:quiz_app/widgets/text_field_widgets.dart';

class AddQuestionsPage extends StatefulWidget {
  AddQuestionsPage({Key key}) : super(key: key);

  @override
  _AddQuestionsPageState createState() => _AddQuestionsPageState();
}

class _AddQuestionsPageState extends State<AddQuestionsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                  Form(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Left button
                              SmallButtonWidget(
                                icon: arrowLeftCircleIcon,
                                radius: 5,
                                iconColor: whiteColor,
                                backgroundColor: darkGreenColor,
                                height: 50,
                                width: 50,
                                btnOnTap: null,
                              ),
                              // Center button
                              Expanded(
                                child: MediumButtonWidget(
                                  text: submitTextEn,
                                  color: greenColor,
                                  radius: 5,
                                  height: 50,
                                  btnOnTap: null,
                                ),
                              ),
                              // Right button
                              SmallButtonWidget(
                                icon: arrowRightCircleIcon,
                                radius: 5,
                                iconColor: whiteColor,
                                backgroundColor: darkGreenColor,
                                height: 50,
                                width: 50,
                                btnOnTap: null,
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
}
