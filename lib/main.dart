import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //TDO change question index so it has right starting value
  int questionIndex = 0;
  int points = 0;
  List<List<String>> questions = [
    ["Kolik má člověk rukou?", "1", "2", "3", "4"],
    ["Co je to olgoj chorchoj?", "červ", "houba", "mech", "bylina"],
    ["Kolik má Praha věží?", "20", "50", "100", "1000"],
    ["Kolik má rok dní?", "356", "360", "365", "367"],
  ];
  //TDO change list of answers so it is correct
  List<int> answers = [2, 1, 3, 3];

  List<String> images = ["ruce", "countryside", "Prague", "calendar"];

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //TDO replace false with a valid value
          title: questionIndex < answers.length
              ? Text("Quiz $questionIndex",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.9), fontSize: 24))
              : Text("End of game"),
          centerTitle: true,
        ),
        body: Center(
          child: questionIndex < answers.length
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 25.0),
                    QuestionText(question: questions[questionIndex][0]),
                    SizedBox(height: 25.0),
                    AnswerButton(
                      //TDO change line under so it is correct
                      answer: questions[questionIndex][1],
                      onTap: () {
                        setState(() {
                          if (answers[questionIndex] == 1) {
                            points = points + questionIndex * 10 + 10;
                          }
                          questionIndex++;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    AnswerButton(
                      answer: questions[questionIndex][2],
                      onTap: () {
                        setState(() {
                          //TDO correct the line under
                          if (answers[questionIndex] == 2) {
                            points = points + questionIndex * 10 + 10;
                          }
                          questionIndex++;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    AnswerButton(
                      answer: questions[questionIndex][3],
                      onTap: () {
                        setState(() {
                          if (answers[questionIndex] == 3) {
                            points = points + questionIndex * 10 + 10;
                          }
                          questionIndex++;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    AnswerButton(
                      answer: questions[questionIndex][4],
                      onTap: () {
                        setState(() {
                          if (answers[questionIndex] == 4) {
                            points = points + questionIndex * 10 + 10;
                          }
                          questionIndex++;
                        });
                      },
                    ),
                    SizedBox(height: 40.0),
                    Image.asset("assets/${images[questionIndex]}.jpg"),
                  ],
                )
              : Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 25, 178, 238),
                      Color.fromARGB(255, 21, 236, 229),
                    ],
                  )),
                  child: Column(
                    children: [
                      SizedBox(height: 220.0),
                      Text(
                        "Your points: $points",
                        style: const TextStyle(
                            fontSize: 35.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 30.0),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              color: Colors.tealAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "Try again",
                              style: TextStyle(fontSize: 35.0),
                            ),
                          ),
                        ),
                        onTap: () {
                          //TDO fix this function so it works
                          setState(() {
                            questionIndex = 0;
                            points = 0;
                          });
                        },
                      ),
                    ],
                  ),
                ),

          // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}

class QuestionText extends StatelessWidget {
  final String question;
  const QuestionText({required this.question, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      question,
      style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
    );
  }
}

class AnswerButton extends StatelessWidget {
  final String answer;
  final Function() onTap;

  const AnswerButton({required this.answer, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            color: Color.fromARGB(195, 34, 149, 242),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        height: 50.0,
        //TDO fix line under
        width: 300.0,
        child: Center(
          child: Text(
            answer,
            style: TextStyle(fontSize: 40.0),
          ),
        ),
      ),
    );
  }
}
