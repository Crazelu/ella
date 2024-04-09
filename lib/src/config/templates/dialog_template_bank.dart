import 'package:ella/src/config/template_action.dart';
import 'package:ella/src/config/template_bank.dart';

class DialogTemplateBank extends TemplateBank {
  DialogTemplateBank({required super.actions});

  factory DialogTemplateBank.defaultBank() {
    return DialogTemplateBank(
      actions: [
        TemplateAction(
          template: 'dialog/generator.template',
          outputPath: 'lib/core/dialog/dialog_generator.dart',
        ),
        TemplateAction(
          template: 'dialog/handler.template',
          outputPath: 'lib/core/dialog/dialog_handler.dart',
        ),
        TemplateAction(
          template: 'dialog/message.template',
          outputPath: 'lib/core/dialog/dialog_message.dart',
        ),
        TemplateAction(
          template: 'dialog/routes.template',
          outputPath: 'lib/core/dialog/dialog_routes.dart',
        ),
      ],
    );
  }
}
