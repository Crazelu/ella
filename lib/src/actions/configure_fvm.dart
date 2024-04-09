import 'dart:io';
import 'package:ella/src/actions/prettify_json.dart';
import 'package:ella/src/utils/constants.dart';
import 'package:ella/src/actions/create_file.dart';
import 'package:ella/src/actions/read_ella_config.dart';
import 'package:ella/src/utils/working_directory.dart';

Future<void> configureFvm() async {
  final config = await readEllaConfig();
  final flutterVersion = config[EllaKeys.fvmFlutterVerion];

  if (flutterVersion != null) {
    print('Configuring FVM...');

    await Process.run('fvm', ['install', flutterVersion]);

    await Process.run(
      'fvm',
      ['use', flutterVersion],
      workingDirectory: WorkingDirectory.dir,
    );

    final vscodeDir = Directory('${WorkingDirectory.dir}/.vscode');

    if (vscodeDir.existsSync()) {
      final fvmSettings = {
        "dart.flutterSdkPath": ".fvm/flutter_sdk",
        // Remove .fvm files from search
        "search.exclude": {"**/.fvm": true},
        // Remove from file watching
        "files.watcherExclude": {"**/.fvm": true}
      };

      await createFile(EllaKeys.vscodeSettingsJsonPath);

      final vscodeSettingsConfig =
          File('${WorkingDirectory.dir}/${EllaKeys.vscodeSettingsJsonPath}');

      if (vscodeSettingsConfig.existsSync()) {
        vscodeSettingsConfig.deleteSync();
      }

      await vscodeSettingsConfig.create(recursive: true);
      await vscodeSettingsConfig.writeAsString(prettifyJson(fvmSettings));
    }
  }
}
