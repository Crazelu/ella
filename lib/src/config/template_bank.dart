import 'package:ella/src/actions/read_ella_config.dart';
import 'package:ella/src/config/template_action.dart';

class TemplateBank {
  TemplateBank({required this.actions});

  factory TemplateBank.defaultBank(List<String> flavors) {
    return TemplateBank(
      actions: [
        TemplateAction(
          template: 'di.template',
          outputPath: 'lib/core/dependencies/dependency_registry.dart',
        ),
        TemplateAction(
          template: 'pubspec.template',
          outputPath: 'pubspec.yaml',
        ),
        TemplateAction(
          template: 'readme.template',
          outputPath: 'README.md',
        ),
        TemplateAction(
          template: 'environment.template',
          outputPath: 'lib/core/environment.dart',
        ),
        TemplateAction(
          template: 'l10n.template',
          outputPath: 'l10n.yaml',
        ),
        TemplateAction(
          template: 'app_en_arb.template',
          outputPath: 'l10n/app_en.arb',
        ),
        TemplateAction(
          template: 'app.template',
          outputPath: 'lib/core/app/app.dart',
        ),
        TemplateAction(
          template: 'app_routes/routes.template',
          outputPath: 'lib/core/routes/routes.dart',
        ),
        TemplateAction(
          template: 'app_routes/route_generator.template',
          outputPath: 'lib/core/routes/route_generator.dart',
        ),
        TemplateAction(
          template: 'logger.template',
          outputPath: 'lib/core/utils/logger.dart',
        ),
        TemplateAction(
          template: 'mocks.template',
          outputPath: 'test/mocks.dart',
        ),
        TemplateAction(
          template: 'widget_test.template',
          outputPath: 'test/widget_test.dart',
        ),
        TemplateAction(
          template: 'makefile.template',
          outputPath: 'Makefile',
        ),
        for (final flavor in flavors)
          TemplateAction(
            outputPath: 'lib/main.$flavor.dart',
            template: flavor == 'dev' ? 'main_dev.template' : 'main.template',
          )
      ],
    );
  }

  final List<TemplateAction> actions;

  Future<void> execute() async {
    final config = await readEllaConfig();
    Future.forEach(actions, (action) => action.execute(config));
  }
}
