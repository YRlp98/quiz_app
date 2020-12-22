import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/theme/colors.dart';
import 'package:quiz_app/widgets/button_widgets.dart';

import '../models/questionModel.dart';
import '../services/database.dart';
import '../theme/strings.dart';
import '../theme/text_style.dart';
import '../widgets/loading_widgets.dart';
import '../widgets/quiz_widgets.dart';

class QuizPage extends StatefulWidget {
  final String quizId, quizTitle, quizImageUrl;

  QuizPage({
    Key key,
    @required this.quizId,
    @required this.quizImageUrl,
    @required this.quizTitle,
  }) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

int total = 0;
int _correct = 0;
int _incorrect = 0;
int _notAttempted = 0;

class _QuizPageState extends State<QuizPage> {
  bool _isLoading = true;
  QuerySnapshot questionSnaphot;
  DataBaseService dataBaseService = new DataBaseService();

  @override
  void initState() {
    print('QUIZ ID: ' + widget.quizId); // Check Quiz ID
    // Get quiz data
    dataBaseService.getQuizData(widget.quizId).then((value) {
      questionSnaphot = value;
      _notAttempted = 0;
      _correct = 0;
      _incorrect = 0;
      total = questionSnaphot.documents.length;
      _isLoading = false;

      setState(() {}); // To refresh page after getting data

      print('TOTAL : ' + total.toString()); // Check getting data
    });
    super.initState();
  }

  QuestionModel getQuestionModelFromDataSnapshot(
      DocumentSnapshot questionSnapshot) {
    QuestionModel questionModel = new QuestionModel();

    questionModel.question = questionSnapshot.data['question'];

    List<String> options = [
      questionSnapshot.data['answer1'],
      questionSnapshot.data['answer2'],
      questionSnapshot.data['answer3'],
      questionSnapshot.data['answer4'],
    ];

    options.shuffle(); // Shuffle options

    questionModel.answer1 = options[0];
    questionModel.answer2 = options[1];
    questionModel.answer3 = options[2];
    questionModel.answer4 = options[3];
    questionModel.correctAnswer = questionSnapshot.data['answer1'];
    questionModel.answered = false;

    return questionModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        //* Appbar
        headerSliverBuilder: appBar,
        //* Body
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _isLoading
                    ? bodyLoading()
                    : Container(
                        child: questionSnaphot.documents == null
                            ? bodyLoading()
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                itemCount: total,
                                // itemCount: questionSnaphot.documents.length,
                                itemBuilder: (context, index) {
                                  return BuildQuizTile(
                                    questionModel:
                                        getQuestionModelFromDataSnapshot(
                                      questionSnaphot.documents[index],
                                    ),
                                    index: index,
                                  );
                                }),
                      ),
                LongButtonWidget(
                  text: finishTextEn,
                  color: greenColor,
                  btnOnTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //* Appbar
  List<Widget> appBar(BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverAppBar(
        expandedHeight: 200,
        floating: true,
        pinned: false,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: RichText(
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              text: widget.quizTitle,
              style: heading4RegularBlackEnStyle,
            ),
          ),
          background: Stack(
            children: [
              // Quiz image
              Image.network(
                widget.quizImageUrl,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              // Light layer
              Container(
                padding: const EdgeInsets.only(
                    top: 20, right: 20, left: 20, bottom: 20),
                color: Colors.white.withOpacity(0.3),
                alignment: Alignment.centerLeft,
              ),
            ],
          ),
        ),
      ),
    ];
  }

//* Body
  Center bodyLoading() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            waitForDataTextEn,
            style: heading4BlackEnStyle,
          ),
          SizedBox(height: 20),
          CircularLoadingWidget(),
        ],
      ),
    );
  }
}

class BuildQuizTile extends StatefulWidget {
  final QuestionModel questionModel;
  final int index;

  BuildQuizTile({
    Key key,
    this.questionModel,
    this.index,
  }) : super(key: key);

  @override
  _BuildQuizTileState createState() => _BuildQuizTileState();
}

class _BuildQuizTileState extends State<BuildQuizTile> {
  String optionSelected = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Question
          Text(
            '${widget.index + 1}. ' + widget.questionModel.question,
            style: paragraphDarkestGreyBoldEnStyle,
          ),
          SizedBox(height: 20),
          // Option 1 (Correct Answer)
          GestureDetector(
            child: OptionTileWidget(
              option: '1',
              answer: widget.questionModel.answer1,
              correctAnser: widget.questionModel.correctAnswer,
              optionSelected: optionSelected,
            ),
            onTap: () {
              print('TITLE #1');
              if (!widget.questionModel.answered) {
                if (widget.questionModel.answer1 ==
                    widget.questionModel.correctAnswer) {
                  setState(() {
                    optionSelected = widget.questionModel.answer1;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                    _notAttempted = _notAttempted - 1;
                  }); // To widget reload itself
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.answer1;
                    widget.questionModel.answered = true;
                    _incorrect = _incorrect + 1;
                    _notAttempted = _notAttempted - 1;
                  }); // To widget reload itself
                }
              }
            },
          ),
          SizedBox(height: 20),
          // Option 2
          GestureDetector(
            child: OptionTileWidget(
              option: '2',
              answer: widget.questionModel.answer2,
              correctAnser: widget.questionModel.correctAnswer,
              optionSelected: optionSelected,
            ),
            onTap: () {
              print('TITLE #2');
              if (!widget.questionModel.answered) {
                if (widget.questionModel.answer2 ==
                    widget.questionModel.correctAnswer) {
                  setState(() {
                    optionSelected = widget.questionModel.answer2;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                    _notAttempted = _notAttempted - 1;
                  }); // To widget reload itself
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.answer2;
                    widget.questionModel.answered = true;
                    _incorrect = _incorrect + 1;
                    _notAttempted = _notAttempted - 1;
                  }); // To widget reload itself
                }
              }
            },
          ),
          SizedBox(height: 20),
          // Option 3
          GestureDetector(
            child: OptionTileWidget(
              option: '3',
              answer: widget.questionModel.answer3,
              correctAnser: widget.questionModel.correctAnswer,
              optionSelected: optionSelected,
            ),
            onTap: () {
              print('TITLE #3');
              if (!widget.questionModel.answered) {
                if (widget.questionModel.answer3 ==
                    widget.questionModel.correctAnswer) {
                  setState(() {
                    optionSelected = widget.questionModel.answer3;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                    _notAttempted = _notAttempted - 1;
                  }); // To widget reload itself
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.answer3;
                    widget.questionModel.answered = true;
                    _incorrect = _incorrect + 1;
                    _notAttempted = _notAttempted - 1;
                  }); // To widget reload itself
                }
              }
            },
          ),
          SizedBox(height: 20),
          // Option 4
          GestureDetector(
            child: OptionTileWidget(
              option: '4',
              answer: widget.questionModel.answer4,
              correctAnser: widget.questionModel.correctAnswer,
              optionSelected: optionSelected,
            ),
            onTap: () {
              print('TITLE #4');
              if (!widget.questionModel.answered) {
                if (widget.questionModel.answer4 ==
                    widget.questionModel.correctAnswer) {
                  setState(() {
                    optionSelected = widget.questionModel.answer4;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                    _notAttempted = _notAttempted - 1;
                  }); // To widget reload itself
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.answer4;
                    widget.questionModel.answered = true;
                    _incorrect = _incorrect + 1;
                    _notAttempted = _notAttempted - 1;
                  }); // To widget reload itself
                }
              }
            },
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
