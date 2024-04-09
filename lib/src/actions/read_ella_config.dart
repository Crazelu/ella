import 'dart:convert';
import 'dart:io';
import 'package:ella/src/utils/working_directory.dart';

Future<Map<String, dynamic>> readEllaConfig() async {
  final config = File('${WorkingDirectory.dir}/config.json');
  final content = await config.readAsString();
  return jsonDecode(content);
}
