import 'package:ella/src/config/template_action.dart';
import 'package:ella/src/config/template_bank.dart';

class ApiClientTemplateBank extends TemplateBank {
  ApiClientTemplateBank({required super.actions});

  factory ApiClientTemplateBank.defaultBank() {
    return ApiClientTemplateBank(
      actions: [
        TemplateAction(
          template: 'api_client/api_client.template',
          outputPath: 'lib/core/io/api_client.dart',
        ),
        TemplateAction(
          template: 'api_client/logging_interceptor.template',
          outputPath: 'lib/core/io/logging_interceptor.dart',
        ),
      ],
    );
  }
}
