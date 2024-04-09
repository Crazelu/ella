import 'dart:io';
import 'package:ella/src/utils/constants.dart';
import 'package:ella/src/actions/read_ella_config.dart';
import 'package:ella/src/utils/working_directory.dart';

Future<void> updateGitIgnore() async {
  final config = await readEllaConfig();

  String contentToAppendToGitIgnore = '\n# Added by ella\n.vscode/\nenv.*.json';

  if (config[EllaKeys.fvmFlutterVerion] != null) {
    contentToAppendToGitIgnore += '\n.fvm/';
  }

  final gitignoreFile = File('${WorkingDirectory.dir}/.gitignore');

  await gitignoreFile.writeAsString(
    contentToAppendToGitIgnore,
    mode: FileMode.append,
  );
}
