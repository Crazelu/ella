import 'package:ella/src/config/template_action.dart';
import 'package:ella/src/config/template_bank.dart';

class WebAppTemplateBank extends TemplateBank {
  WebAppTemplateBank({required super.actions});

  factory WebAppTemplateBank.defaultBank() {
    return WebAppTemplateBank(
      actions: [
        TemplateAction(
          template: 'web_app/footer.template',
          outputPath: 'lib/core/presentation/widgets/footer.dart',
        ),
        TemplateAction(
          template: 'web_app/responsive_builder.template',
          outputPath: 'lib/core/presentation/widgets/responsive_builder.dart',
        ),
        TemplateAction(
          template: 'web_app/app.template',
          outputPath: 'lib/core/app/app.dart',
        ),
      ],
    );
  }
}
