class Question {
  const Question({
    required this.question,
    required this.key,
    required this.answerValidator,
    this.hint,
    this.defaultResponse,
    this.answerParser,
  });

  final String question;
  final String key;
  final String? hint;
  final Object? defaultResponse;
  final bool Function(String) answerValidator;
  final Object Function(String)? answerParser;
}
