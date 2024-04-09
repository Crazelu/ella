import 'dart:convert';
import 'dart:io';
import 'package:ella/src/actions/prettify_json.dart';
import 'package:ella/src/utils/constants.dart';
import 'package:ella/src/utils/working_directory.dart';

Future<void> appendToEllaConfig(Map<String, dynamic> entry) async {
  final file = File('${WorkingDirectory.dir}/${EllaKeys.ellaConfigFilePath}');
  final config = jsonDecode(file.readAsStringSync()) as Map;
  config.addAll(entry);
  await file.writeAsString(prettifyJson(config));
}
