import 'dart:convert';
import 'dart:io';
import 'package:ella/src/actions/setup_ella_config.dart';
import 'package:ella/src/utils/constants.dart';
import 'package:ella/src/actions/create_file.dart';
import 'package:ella/src/utils/working_directory.dart';

Future<void> startEllaConfigurationSetup() async {
  await createFile(EllaKeys.ellaConfigFilePath);

  final configMap = await setupEllaConfig();
  print(configMap);

  final config = File('${WorkingDirectory.dir}/${EllaKeys.ellaConfigFilePath}');

  if (config.existsSync()) {
    config.deleteSync();
  }

  await config.create();
  await config.writeAsString(jsonEncode(configMap));
}
