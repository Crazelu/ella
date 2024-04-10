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
        TemplateAction(
          template: 'web_app/scroll_behavior.template',
          outputPath: 'lib/core/presentation/widgets/scroll_behavior.dart',
        ),
        TemplateAction(
          template: 'web_app/test_shared.template',
          outputPath: 'test/shared.dart',
        ),
        TemplateAction(
          template: 'web_app/pages.template',
          outputPath: 'lib/pages.dart',
        ),
        TemplateAction(
          template: 'web_app/routes.template',
          outputPath: 'lib/core/routes/routes.dart',
        ),
        TemplateAction(
          template: 'web_app/route_generator.template',
          outputPath: 'lib/core/routes/route_generator.dart',
        ),
        TemplateAction(
          template: 'web_app/home_page.template',
          outputPath: 'lib/features/home/presentation/pages/home_page.dart',
        ),
        TemplateAction(
          template: 'web_app/home_view_model.template',
          outputPath:
              'lib/features/home/presentation/viewmodels/home_view_model.dart',
        ),
        TemplateAction(
          template: 'web_app/widget_test.template',
          outputPath: 'test/widget_test.dart',
        ),
      ],
    );
  }
}
