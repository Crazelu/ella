import 'dart:io';
import 'package:ella/src/actions/add_dependency_to_pubspec.dart';
import 'package:ella/src/actions/append_to_ella_config.dart';
import 'package:ella/src/actions/read_ella_config.dart';
import 'package:ella/src/actions/update_web_files.dart';
import 'package:ella/src/config/template_bank.dart';
import 'package:ella/src/config/templates/api_client_template_bank.dart';
import 'package:ella/src/config/templates/data_template_bank.dart';
import 'package:ella/src/config/templates/dialog_template_bank.dart';
import 'package:ella/src/config/templates/extension_template_bank.dart';
import 'package:ella/src/config/templates/navigation_template_bank.dart';
import 'package:ella/src/config/templates/screens_template_bank.dart';
import 'package:ella/src/config/templates/view_model_template_bank.dart';
import 'package:ella/src/config/templates/web_app_template_bank.dart';
import 'package:ella/src/utils/constants.dart';
import 'package:ella/src/utils/working_directory.dart';

Future<void> scaffoldProject(String platforms) async {
  final config = await readEllaConfig();
  final flavors = List<String>.from(config[EllaKeys.flavors] ?? []);

  if (platforms.contains('web')) {
    await appendToEllaConfig(
      {
        EllaKeys.webPathUrlStrategyConfig: 'setPathUrlStrategy();',
        EllaKeys.webPathUrlStrategyConfigImport:
            "import 'package:url_strategy/url_strategy.dart';",
      },
    );
  } else {
    await appendToEllaConfig({
      EllaKeys.webPathUrlStrategyConfig: '',
      EllaKeys.webPathUrlStrategyConfigImport: '',
    });
  }

  await TemplateBank.defaultBank(flavors).execute();
  await NavigationTemplateBank.defaultBank().execute();
  await DataTemplateBank.defaultBank().execute();
  await DialogTemplateBank.defaultBank().execute();
  await ApiClientTemplateBank.defaultBank().execute();
  await ExtensionTemplateBank.defaultBank().execute();
  await ScreensTemplateBank.defaultBank().execute();
  await ViewModelTemplateBank.defaultBank().execute();

  if (platforms.contains('web')) {
    // wait for lib/core/app/app.dart to be created
    // before WebAppTemplateBank attempts to modify the file
    await Future.delayed(const Duration(seconds: 1));

    // delete any generated feature directory
    final featureDirectory = Directory('${WorkingDirectory.libDir}/features');
    if (await featureDirectory.exists()) {
      await featureDirectory.delete(recursive: true);
    }

    // delete any generated screens barrel export file
    final screensFile = File('${WorkingDirectory.libDir}/screens.dart');
    if (await screensFile.exists()) {
      await screensFile.delete(recursive: true);
    }

    await WebAppTemplateBank.defaultBank().execute();
    await updateWebFiles();
    await addDependencyToPubspec(dependency: 'url_launcher', version: '^6.2.5');
    await addDependencyToPubspec(dependency: 'url_strategy', version: '^0.2.0');
  }

  final mainFile = File('${WorkingDirectory.libDir}/main.dart');
  if (await mainFile.exists()) {
    await mainFile.delete();
  }
}
