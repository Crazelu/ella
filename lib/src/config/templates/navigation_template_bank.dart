import 'package:ella/src/config/template_action.dart';
import 'package:ella/src/config/template_bank.dart';

class NavigationTemplateBank extends TemplateBank {
  NavigationTemplateBank({required super.actions});

  factory NavigationTemplateBank.defaultBank() {
    return NavigationTemplateBank(
      actions: [
        TemplateAction(
          template: 'navigation/bus.template',
          outputPath: 'lib/core/navigation/navigation_bus.dart',
        ),
        TemplateAction(
          template: 'navigation/intent.template',
          outputPath: 'lib/core/navigation/navigation_intent.dart',
        ),
        TemplateAction(
          template: 'navigation/listener.template',
          outputPath: 'lib/core/navigation/navigation_listener.dart',
        ),
        TemplateAction(
          template: 'navigation/navigation.template',
          outputPath: 'lib/core/navigation/navigation.dart',
        ),
      ],
    );
  }
}
