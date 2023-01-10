import 'question.dart';

class AppBrain {
  int _questionsNumber = 0;

  final List<Question> _questionGroup = [
    Question(
      q: 'عدد كواكب المجموعه الشمسيه 8 كواكب',
      i: 'images/image-1.jpg',
      a: true,
    ),
    Question(
      q: 'القطط حيوانات لاحمه',
      i: 'images/image-2.jpg',
      a: true,
    ),
    Question(
      q: 'الصين موجوده في قاره افريقيا',
      i: 'images/image-3.jpg',
      a: false,
    ),
    Question(
      q: 'الارض مسطحه وليست كرويه',
      i: 'images/image-4.jpg',
      a: false,
    ),
    Question(
      q: 'باستطاعت الانسان البقاء على قيد الحياه بدون اكل اللحوم',
      i: 'images/image-5.jpg',
      a: true,
    ),
    Question(
      q: 'الشمس تدور حول الارض والارض تدور حول القمر',
      i: 'images/image-6.jpg',
      a: false,
    ),
    Question(
      q: 'الحيوانات لا تشعر بالالم',
      i: 'images/image-7.jpg',
      a: false,
    ),
  ];

  void nextQustion() {
    if (_questionsNumber < _questionGroup.length - 1) {
      _questionsNumber++;
    }
  }

  bool isFinished() {
    if (_questionsNumber >= _questionGroup.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionsNumber = 0;
  }

  String getQustionText() {
    return _questionGroup[_questionsNumber].questionText;
  }

  String getQustionImage() {
    return _questionGroup[_questionsNumber].questionImage;
  }

  bool getQustionAnswer() {
    return _questionGroup[_questionsNumber].questionAnswer;
  }
}
