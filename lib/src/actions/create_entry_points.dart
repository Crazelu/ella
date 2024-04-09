import 'package:ella/src/actions/create_file.dart';
import 'package:ella/src/actions/read_ella_config.dart';
import 'package:ella/src/utils/constants.dart';
import 'package:ella/src/utils/working_directory.dart';

Future<void> createEntryPoints() async {
  final config = await readEllaConfig();
  final flavors = config[EllaKeys.flavors] ?? [];

  // create entry points and env json files
  for (final flavor in flavors) {
    await createFile(
      'main.$flavor.dart',
      workingDirectory: WorkingDirectory.libDir,
    );
    await createFile(
      'env.$flavor.json',
      workingDirectory: WorkingDirectory.dir,
    );
  }
}
