import 'package:flutter/material.dart';

import '../theme/text_style.dart';

//* Quiz card widget
class QuizCardWidget extends StatelessWidget {
  final String imageUrl, quizTitle, quizDesc;
  final Function ontap;

  const QuizCardWidget({
    Key key,
    @required this.imageUrl,
    @required this.quizTitle,
    @required this.quizDesc,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(top: 7.5, bottom: 7.5),
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Stack(
            children: [
              // Quiz image
              Image.network(
                imageUrl,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              // Daark layer
              Container(
                padding: const EdgeInsets.only(
                    top: 20, right: 20, left: 20, bottom: 20),
                color: Colors.black.withOpacity(0.5),
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Quiz title
                    RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: quizTitle,
                        style: heading5BoldWhiteEnStyle,
                      ),
                    ),
                    SizedBox(height: 10),
                    // Quiz desc
                    Text(
                      quizDesc,
                      style: paragraphWhiteEnStyle,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        ontap();
        print('QUIZ CARD');
      },
    );
  }
}
