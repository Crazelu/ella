import 'package:ella/src/config/template_action.dart';
import 'package:ella/src/config/template_bank.dart';

class DataTemplateBank extends TemplateBank {
  DataTemplateBank({required super.actions});

  factory DataTemplateBank.defaultBank() {
    return DataTemplateBank(
      actions: [
        TemplateAction(
          template: 'data/local_cache.template',
          outputPath: 'lib/core/data/local_cache.dart',
        ),
        TemplateAction(
          template: 'data/secure_storage.template',
          outputPath: 'lib/core/data/secure_storage.dart',
        ),
      ],
    );
  }
}
