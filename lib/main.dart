// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'app_brain.dart';

AppBrain appBrain = AppBrain();

void main() {
  runApp(const ExApp());
}

class ExApp extends StatelessWidget {
  const ExApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text(
            'اختبار',
            style: TextStyle(fontFamily: 'Cairo', color: Colors.black87),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: ExamPage(),
        ),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<Widget> answerResult = [];
  int rightAnswers = 0;
  // List<String> questions = [
  //   'عدد كواكب المجموعه الشمسيه 8 كواكب',
  //   'القطط حيوانات لاحمه',
  //   'الصين موجوده في قاره افريقيا',
  //   'الارض مسطحه وليست كرويه',
  //   ''
  // ];
  // List<String> questionImage = [
  //   'images/image-1.jpg',
  //   'images/image-2.jpg',
  //   'images/image-3.jpg',
  //   'images/image-4.jpg',
  //   ''
  // ];
  // List<bool> answers = [
  //   true,
  //   true,
  //   false,
  //   false,
  //   false,
  // ];

  void chckAnswer(bool whatUserAnswer) {
    bool correctAnswer = appBrain.getQustionAnswer();
    setState(() {
      if (whatUserAnswer == correctAnswer) {
        rightAnswers++;
        answerResult.add(
          const Icon(
            Icons.circle,
            color: Colors.green,
          ),
        );
      } else {
        answerResult.add(
          const Icon(
            Icons.circle,
            color: Colors.red,
          ),
        );
      }
      if (appBrain.isFinished() == true) {
        Alert(
          context: context,
          title: "انتهاء الاختبار",
          desc: "لقد اجبت على $rightAnswers اسئله من اصل 7",
          buttons: [
            DialogButton(
              // ignore: prefer_const_constructors
              child: Text(
                "ابداء من جديد",
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        appBrain.reset();
        answerResult = [];
        rightAnswers = 0;
      } else {
        appBrain.nextQustion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ignore: prefer_const_constructors
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: answerResult,
          ),
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset(
                appBrain.getQustionImage(),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                appBrain.getQustionText(),
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 17.0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 13.0),
            child: ElevatedButton(
              onPressed: () {
                chckAnswer(true);
              },
              child: const Text(
                'صحيح',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 17.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 13.0),
            child: ElevatedButton(
              onPressed: () {
                chckAnswer(false);
              },
              child: const Text(
                'خطأ',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 17.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
