import 'dart:io';
import 'package:ella/src/config/question_bank.dart';

Future<Map<String, dynamic>> setupEllaConfig() async {
  Map<String, dynamic> result = {};

  final questionBank = QuestionBank.defaultBank();
  final questionCount = questionBank.questions.length;
  int count = 0;

  while (count < questionCount) {
    final question = questionBank.questions[count];

    print(question.question);

    final answer = stdin.readLineSync();

    if (answer == null || answer.isEmpty) {
      // use default response (if available) if answer is empty
      if (question.defaultResponse != null) {
        result.putIfAbsent(question.key, () => question.defaultResponse);
      }
      count++;
    } else {
      if (question.answerValidator(answer)) {
        result.putIfAbsent(
          question.key,
          () => question.answerParser?.call(answer) ?? answer,
        );
        count++;
      } else {
        print('Invalid answer entered');
        //show hint if available
        if (question.hint != null) {
          print('${question.hint}\n');
        }
      }
    }
  }

  return result;
}
