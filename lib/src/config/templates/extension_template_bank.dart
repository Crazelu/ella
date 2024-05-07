import 'package:ella/src/config/template_action.dart';
import 'package:ella/src/config/template_bank.dart';

class ExtensionTemplateBank extends TemplateBank {
  ExtensionTemplateBank({required super.actions});

  factory ExtensionTemplateBank.defaultBank() {
    return ExtensionTemplateBank(
      actions: [
        TemplateAction(
          template: 'extensions/localization.template',
          outputPath: 'lib/core/extensions/localization_extension.dart',
        ),
      ],
    );
  }
}
