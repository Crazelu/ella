import 'dart:io';
import 'package:ella/src/actions/create_file.dart';
import 'package:ella/src/actions/prettify_json.dart';
import 'package:ella/src/actions/read_ella_config.dart';
import 'package:ella/src/utils/constants.dart';
import 'package:ella/src/utils/working_directory.dart';

Future<void> createVsCodeConfigurations() async {
  final config = await readEllaConfig();
  final flavors = config[EllaKeys.flavors] ?? [];

  Map<String, dynamic> vsCodeConfig = {
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    'version': '0.2.0',
    'configurations': [],
  };

  // create configurations for each flavor
  for (final flavor in flavors) {
    vsCodeConfig['configurations'].add(
      {
        'name': flavor,
        'request': 'launch',
        'type': 'dart',
        'program': 'lib/main.$flavor.dart',
        'args': [
          '--dart-define-from-file',
          'env.$flavor.json',
        ]
      },
    );
  }

  // setup vscode configurations
  await createFile(EllaKeys.vscodeLaunchJsonPath);
  final vscodeLaunchConfig =
      File('${WorkingDirectory.dir}/${EllaKeys.vscodeLaunchJsonPath}');

  if (vscodeLaunchConfig.existsSync()) {
    vscodeLaunchConfig.deleteSync();
  }

  await vscodeLaunchConfig.create(recursive: true);
  await vscodeLaunchConfig.writeAsString(prettifyJson(vsCodeConfig));
}
