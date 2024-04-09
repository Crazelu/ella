import 'dart:convert';
import 'dart:io';
import 'package:ella/src/actions/format_pubspec.dart';
import 'package:ella/src/utils/working_directory.dart';
import 'package:yaml/yaml.dart';

Future<void> addDependencyToPubspec({
  required String dependency,
  required String version,
}) async {
  final pubspecFile = File('${WorkingDirectory.dir}/pubspec.yaml');
  if (await pubspecFile.exists()) {
    final pubspecContent = await pubspecFile.readAsString();

    final yaml = Map<String, dynamic>.from(loadYaml(pubspecContent));
    Map<String, dynamic> pubspec = {...jsonDecode(jsonEncode(yaml))};
    pubspec['dependencies'] = <String, dynamic>{
      ...pubspec['dependencies'],
      dependency: version,
    };
    await formatPubspec(pubspec);
  }
}
