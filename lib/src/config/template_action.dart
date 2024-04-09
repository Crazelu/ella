import 'dart:io';
import 'package:ella/src/actions/create_file.dart';
import 'package:ella/src/utils/working_directory.dart';

class TemplateAction {
  const TemplateAction({
    required this.outputPath,
    this.template,
    this.templatePath,
  }) : assert(
          template != null || templatePath != null,
          'template and templatePath cannot both be null',
        );

  final String? template;
  final String outputPath;
  final String? templatePath;

  Future<void> execute(Map<String, dynamic> config) async {
    final outputFile = File('${WorkingDirectory.dir}/$outputPath');
    final templateFile = File(templatePath ?? 'lib/src/templates/$template');

    String content = await templateFile.readAsString();

    for (final key in config.keys) {
      if (config[key] is String) {
        content = content.replaceAll('\${$key}', config[key]);
      }
    }

    final recursive = outputPath.split('/').isNotEmpty;

    if (await outputFile.exists()) {
      await outputFile.delete(recursive: recursive);
    } else {
      String? outputDirectory;

      final splits = outputPath.split('/');

      if (splits.isNotEmpty) {
        splits.removeLast();
        outputDirectory = splits.join('/');
      }

      if (outputDirectory != null) {
        final directory = Directory('${WorkingDirectory.dir}/$outputDirectory');
        await directory.create(recursive: true);
      }

      await createFile(
        outputPath,
        workingDirectory: '${WorkingDirectory.dir}/$outputDirectory',
      );
    }

    await outputFile.create(recursive: recursive);

    await outputFile.writeAsString(content);
  }
}
