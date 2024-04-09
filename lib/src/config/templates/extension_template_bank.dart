import 'package:ella/src/config/template_action.dart';
import 'package:ella/src/config/template_bank.dart';

class ExtensionTemplateBank extends TemplateBank {
  ExtensionTemplateBank({required super.actions});

  factory ExtensionTemplateBank.defaultBank() {
    return ExtensionTemplateBank(
      actions: [
        TemplateAction(
          template: 'extensions/locale.template',
          outputPath: 'lib/core/extensions/locale_extension.dart',
        ),
      ],
    );
  }
}
