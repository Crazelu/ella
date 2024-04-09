import 'package:ella/src/config/template_action.dart';
import 'package:ella/src/config/template_bank.dart';

class ScreensTemplateBank extends TemplateBank {
  ScreensTemplateBank({required super.actions});

  factory ScreensTemplateBank.defaultBank() {
    return ScreensTemplateBank(
      actions: [
        TemplateAction(
          template: 'screens/screens.template',
          outputPath: 'lib/screens.dart',
        ),
        TemplateAction(
          template: 'screens/splash_screen.template',
          outputPath:
              'lib/features/initialization/presentation/screens/splash_screen.dart',
        ),
      ],
    );
  }
}
