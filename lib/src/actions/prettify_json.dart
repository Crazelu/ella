import 'dart:convert';

const decoder = JsonDecoder();
const encoder = JsonEncoder.withIndent('  ');

String prettifyJson(Object input) {
  if (input is! String) {
    input = json.encode(input);
  }

  var object = decoder.convert(input);
  var prettyString = encoder.convert(object);
  return prettyString;
}
