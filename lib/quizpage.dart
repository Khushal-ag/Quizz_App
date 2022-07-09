import 'package:flutter/material.dart';
import 'package:quizzler/questionBank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class quizpage extends StatefulWidget {
  @override
  State<quizpage> createState() => _quizpageState();
}

class _quizpageState extends State<quizpage> {
  int counter = 0;
  quizBank quiz = quizBank();
  List<Icon> resultCounter = [];
  bool checkCorrect(bool userAnswer) {
    if (userAnswer == quiz.getquestionanswer()) {
      setState(() {
        counter++;
      });
      return true;
    }
  }

  void addCounter(bool userAnswer) {
    setState(() {
      if (quiz.isfinished() == true) {
        checkCorrect(userAnswer);
        Alert(
          context: context,
          title: "Quizz Finished",
          desc: "You have marked $counter correct answers.",
          image: Image.asset("images/images.jpg"),
        ).show();
        quiz.reset();
        resultCounter = [];
        counter = 0;
      } else {
        if (checkCorrect(userAnswer) == true) {
          resultCounter.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          resultCounter.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quiz.nextquestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: Center(
            child: Text(
              'Quizzz',
              style: TextStyle(
                fontFamily: 'RubikMoonrocks',
                fontSize: 35,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      quiz.getquestiontext(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () {
                        addCounter(true);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                      child: Text(
                        'TRUE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () {
                        addCounter(false);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      child: Text(
                        'FALSE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: resultCounter,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
