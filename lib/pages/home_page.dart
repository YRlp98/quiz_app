import 'package:flutter/material.dart';
import 'package:quiz_app/pages/quiz_page.dart';

import '../services/database.dart';
import '../theme/colors.dart';
import '../theme/icons.dart';
import '../theme/images.dart';
import '../theme/strings.dart';
import '../theme/text_style.dart';
import '../widgets/button_widgets.dart';
import '../widgets/card_widgets.dart';
import '../widgets/image_widgets.dart';
import '../widgets/loading_widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stream quizStream;

  DataBaseService dataBaseService = new DataBaseService();

  // Get data from database
  @override
  void initState() {
    dataBaseService.getQuizesData().then((value) {
      quizStream = value;
      setState(() {}); // To refresh page after getting data
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* Appbar
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
      //* Body
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 18),
          child: quizList(),
        ),
      ),
    );
  }

  //* Appbar Functions
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

  //* Body Functions
  Widget quizList() {
    return Container(
      child: StreamBuilder(
        stream: quizStream,
        builder: (context, snapshot) {
          return snapshot.data == null
              ? bodyLoading()
              : ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    return QuizCardWidget(
                      imageUrl:
                          snapshot.data.documents[index].data['quizImageUrl'],
                      quizDesc: snapshot
                          .data.documents[index].data['quizDescription'],
                      quizTitle:
                          snapshot.data.documents[index].data['quizTitle'],
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizPage(
                              quizId:
                                  snapshot.data.documents[index].data['quizId'],
                              quizImageUrl: snapshot
                                  .data.documents[index].data['quizImageUrl'],
                              quizTitle: snapshot
                                  .data.documents[index].data['quizTitle'],
                            ),
                          ),
                        );
                      },
                    );
                  });
        },
      ),
    );
  }

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
