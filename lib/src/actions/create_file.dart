import 'dart:io';
import 'package:ella/src/utils/working_directory.dart';

Future<ProcessResult> createFile(
  String path, {
  String? workingDirectory,
}) {
  return Process.run(
    'touch',
    [path],
    workingDirectory: workingDirectory ?? WorkingDirectory.dir,
  );
}
