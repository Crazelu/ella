import 'dart:io';

Future<void> createDirectory(
  String directory, {
  String? workingDirectory,
}) async {
  await Process.run(
    'mkdir',
    [directory],
    workingDirectory: workingDirectory,
  );
}
