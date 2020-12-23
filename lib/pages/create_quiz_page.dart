import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

import '../services/database.dart';
import '../theme/colors.dart';
import '../theme/strings.dart';
import '../theme/text_style.dart';
import '../widgets/button_widgets.dart';
import '../widgets/loading_widgets.dart';
import '../widgets/text_field_widgets.dart';
import 'add_questions_page.dart';

class CreateQuizPage extends StatefulWidget {
  CreateQuizPage({Key key}) : super(key: key);

  @override
  _CreateQuizPageState createState() => _CreateQuizPageState();
}

class _CreateQuizPageState extends State<CreateQuizPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String quizId, quizTitle, quizImageUrl, quizDescription;
  bool _isLoading = false;
  DataBaseService dataBaseService = new DataBaseService();

  TextEditingController titleController, imageController, descController;

  @override
  void initState() {
    super.initState();
    titleController = new TextEditingController();
    imageController = new TextEditingController();
    descController = new TextEditingController();
  }

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
                  _isLoading
                      ? CircularLoadingWidget()
                      : Form(
                          key: _formKey,
                          child: Container(
                            child: Column(
                              children: [
                                // Title
                                TextFormFiledWidget(
                                  hint: titleTextEn,
                                  label: titleTextEn,
                                  errorMessage: emptytitleErrorTextEn,
                                  textEditingController: titleController,
                                ),
                                SizedBox(height: 10),
                                // Image
                                TextFormFiledWidget(
                                  hint: imageURLTextEn,
                                  label: imageURLTextEn,
                                  errorMessage: emptyimageUrlErrorTextEn,
                                  textEditingController: imageController,
                                ),
                                SizedBox(height: 10),
                                // Description
                                TextFormFiledWidget(
                                  hint: descriptionTextEn,
                                  label: descriptionTextEn,
                                  errorMessage: emptydesciptionErrorTextEn,
                                  textEditingController: descController,
                                ),
                                SizedBox(height: 20),
                                // Button
                                LongButtonWidget(
                                  text: createQuizTextEn,
                                  color: greenColor,
                                  btnOnTap: createQuizLine,
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

  createQuizLine() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      quizId = randomAlphaNumeric(16); // create a random ID

      print('QUIZ ID = ' + quizId);

      Map<String, String> quizMap = {
        'quizId': quizId,
        'quizImageUrl': imageController.text,
        'quizTitle': titleController.text,
        'quizDescription': descController.text,
      };

      await dataBaseService.addQuizData(quizMap, quizId).then((value) {
        setState(() {
          _isLoading = false;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AddQuestionsPage(
                quizId: quizId,
              ),
            ),
          );
        });
      });
    }
  }
}
