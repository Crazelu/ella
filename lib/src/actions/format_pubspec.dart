import 'dart:io';
import 'package:ella/src/utils/working_directory.dart';
import 'package:json2yaml/json2yaml.dart';

Future<void> formatPubspec(Map<String, dynamic> pubspec) async {
  final pubspecFile = File('${WorkingDirectory.dir}/pubspec.yaml');

  String updatedPubspec = json2yaml(pubspec);
  final formattedPubspec = updatedPubspec.replaceAllMapped(
    RegExp(
      '(environment:|dependencies:|dev_dependencies:|flutter_gen:)|(package_parameter_enabled: false)',
    ),
    (match) => match.group(1) != null ? '\n${match[0]}' : '${match[0]}\n',
  );

  await pubspecFile.writeAsString(formattedPubspec, flush: true);
}
