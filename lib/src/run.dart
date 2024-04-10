import 'dart:convert';
import 'dart:io';
import 'package:args/args.dart';
import 'package:ella/src/actions/append_to_ella_config.dart';
import 'package:ella/src/actions/configure_fvm.dart';
import 'package:ella/src/actions/create_directory.dart';
import 'package:ella/src/actions/create_entry_points.dart';
import 'package:ella/src/actions/create_vscode_configurations.dart';
import 'package:ella/src/actions/format_pubspec.dart';
import 'package:ella/src/actions/read_ella_config.dart';
import 'package:ella/src/actions/update_gitignore.dart';
import 'package:ella/src/utils/constants.dart';
import 'package:ella/src/actions/scaffold_project.dart';
import 'package:ella/src/actions/start_ella_configuration_setup.dart';
import 'package:ella/src/utils/working_directory.dart';
import 'package:yaml/yaml.dart';
import 'package:json2yaml/json2yaml.dart';

void run(List<String> args) async {
  final parser = ArgParser();

  parser
    ..addOption('outputDirectory', abbr: 'o', mandatory: true)
    ..addOption('name', abbr: 'n', mandatory: true)
    ..addOption('platforms', defaultsTo: 'android,ios')
    ..addOption('delay', defaultsTo: '1');

  final argResults = parser.parse(args);

  if (argResults.arguments.isEmpty) return;

  final path = argResults['outputDirectory'];
  final projectName = argResults['name'];

  WorkingDirectory.setDir('$path/$projectName');

  await createDirectory(
    projectName,
    workingDirectory: path,
  );

  // create configuration file from interactive Q&A
  await startEllaConfigurationSetup();

  final platforms = argResults['platforms'];

  // create flutter app
  print('Creating flutter app....');
  await Process.run(
    'flutter',
    ['create', '--template', 'app', '--platforms', platforms, projectName],
    workingDirectory: path,
  );

  await appendToEllaConfig({EllaKeys.projectName: projectName});

  // create assets directory
  await createDirectory(
    'assets',
    workingDirectory: WorkingDirectory.dir,
  );
  await createEntryPoints();
  await createVsCodeConfigurations();
  await configureFvm();
  await updateGitIgnore();
  await scaffoldProject(platforms);

  // format generated dart code
  await Process.run(
    'dart',
    ['format', 'lib'],
    workingDirectory: WorkingDirectory.dir,
  );

  // parse pubspec.yaml to temporarily remove 'flutter -> generate: true'
  // so that build_runner can run successfully
  final pubspecFile = File('${WorkingDirectory.dir}/pubspec.yaml');
  final pubspecContent = await pubspecFile.readAsString();

  final yaml = Map<String, dynamic>.from(loadYaml(pubspecContent));
  Map<String, dynamic> pubspec = {...jsonDecode(jsonEncode(yaml))};
  pubspec['flutter'].remove('generate');

  String updatedPubspec = json2yaml(pubspec);
  await pubspecFile.writeAsString(updatedPubspec, flush: true);

  // get dependencies
  await Process.run(
    'flutter',
    ['pub', 'get'],
    workingDirectory: WorkingDirectory.dir,
  );

  final delay = Duration(
    seconds: int.tryParse(argResults['delay']) ?? 1,
  );

  await Future.delayed(delay);

  // run code gen
  await Process.run(
    'flutter',
    [
      'pub',
      'run',
      'build_runner',
      'build',
      '--delete-conflicting-outputs',
    ],
    workingDirectory: WorkingDirectory.dir,
  );

  await Future.delayed(delay);

  // reintroduce temporarily removed 'flutter -> generate: true'
  // and format pubspec.yaml
  final flutterSection = Map<String, dynamic>.from(pubspec['flutter']);
  pubspec['flutter'] = <String, dynamic>{'generate': true, ...flutterSection};
  await formatPubspec(pubspec);

  // get dependencies
  await Process.run(
    'flutter',
    ['pub', 'get'],
    workingDirectory: WorkingDirectory.dir,
  );

  final config = await readEllaConfig();

  // delete config file
  await Process.run(
    'rm',
    ['config.json'],
    workingDirectory: WorkingDirectory.dir,
  );

  if (['y', 'Y'].contains(config[EllaKeys.createInitialCommit])) {
    await Process.run(
      'git',
      ['init'],
      workingDirectory: WorkingDirectory.dir,
    );

    await Process.run(
      'git',
      ['add', '.'],
      workingDirectory: WorkingDirectory.dir,
    );

    await Process.run(
      'git',
      [
        'commit',
        '-m',
        'And Ella said: Let there be code!',
      ],
      workingDirectory: WorkingDirectory.dir,
    );
  }
}
