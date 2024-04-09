import 'package:ella/src/config/question.dart';
import 'package:ella/src/utils/constants.dart';

class QuestionBank {
  QuestionBank({required this.questions});

  factory QuestionBank.defaultBank() {
    return QuestionBank(
      questions: [
        Question(
          question: 'App flavors (hit enter to use default):',
          key: EllaKeys.flavors,
          hint:
              'Enter a comma separated list of flavors you wish to use.\nE.g dev, staging',
          defaultResponse: ['dev', 'staging', 'prod'],
          answerValidator: (value) => value.trim().isNotEmpty,
          answerParser: (value) => value.split(','),
        ),
        Question(
          question:
              'What Flutter version do you want to use with FVM?\nHit enter to create project without FVM',
          key: EllaKeys.fvmFlutterVerion,
          answerValidator: (value) =>
              value.trim().isNotEmpty &&
              (value == 'stable' || value.split('.').length == 3),
        ),
        Question(
          question:
              'What\'s the name of your app?\nThis will be used to name your root app e.g \'Ella\' will generate EllaApp()',
          key: EllaKeys.appName,
          hint: 'App name cannot contain spaces',
          defaultResponse: 'My',
          answerValidator: (value) =>
              value.trim().isNotEmpty && value.trim().split(' ').length == 1,
          answerParser: (value) => value.trim(),
        ),
        Question(
          question:
              'Description for your app which will be added to pubspec.yaml.\nHit enter to skip',
          key: EllaKeys.projectDescription,
          defaultResponse: 'A new Flutter project',
          answerValidator: (value) => value.trim().isNotEmpty,
        ),
        Question(
          question:
              'Do you want Ella to create an initial git commit? [Y/N]\nHit enter to skip',
          key: EllaKeys.createInitialCommit,
          defaultResponse: 'N',
          answerValidator: (value) =>
              value.trim().isNotEmpty &&
              ['Y', 'y', 'N', 'n'].contains(value.trim()),
          answerParser: (value) => value.trim().toLowerCase(),
        ),
      ],
    );
  }

  final List<Question> questions;
}
