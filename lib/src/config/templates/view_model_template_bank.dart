import 'package:ella/src/config/template_action.dart';
import 'package:ella/src/config/template_bank.dart';

class ViewModelTemplateBank extends TemplateBank {
  ViewModelTemplateBank({required super.actions});

  factory ViewModelTemplateBank.defaultBank() {
    return ViewModelTemplateBank(
      actions: [
        TemplateAction(
          template: 'viewmodel/base_view_model.template',
          outputPath: 'lib/core/presentation/viewmodel/base_view_model.dart',
        ),
        TemplateAction(
          template: 'viewmodel/view_model_provider.template',
          outputPath:
              'lib/core/presentation/viewmodel/view_model_provider.dart',
        ),
      ],
    );
  }
}
