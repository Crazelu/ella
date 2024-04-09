import 'dart:convert';
import 'dart:io';
import 'package:ella/src/actions/prettify_json.dart';
import 'package:ella/src/actions/read_ella_config.dart';
import 'package:ella/src/utils/constants.dart';
import 'package:ella/src/utils/working_directory.dart';

Future<void> updateWebFiles() async {
  final manifest = File('${WorkingDirectory.webDir}/manifest.json');
  final indexHtml = File('${WorkingDirectory.webDir}/index.html');

  final config = await readEllaConfig();
  final appName = config[EllaKeys.appName];
  final description = config[EllaKeys.projectDescription];

  if (await manifest.exists()) {
    final content = await manifest.readAsString();
    final manifestData = Map<String, dynamic>.from(jsonDecode(content));

    manifestData['description'] = description;
    manifestData['name'] = appName;
    manifestData['short_name'] = appName;

    await manifest.writeAsString(prettifyJson(manifestData));
  }

  // update title and description of app
  // also add version number script which will should be updated
  // for new deployments to force the browser to invalidate its cache.
  if (await indexHtml.exists()) {
    String content = await indexHtml.readAsString();
    content = content.replaceAll(
      RegExp(r'.*?<meta name="apple-mobile-web-app-title" content=(.*?)>.*'),
      '<meta name="apple-mobile-web-app-title" content="$appName">',
    );
    content = content.replaceAll(
      RegExp(r'.*?<title>(.*?)<\/title>.*'),
      '<title>$appName</title>',
    );
    content = content.replaceAll(
      RegExp(r'.*?<meta name="description" content=(.*)>.*'),
      '<meta name="description" content="$description">',
    );

    if (!content.contains(RegExp(
      r'.*?<script src="main\.dart\.js\?version=(.*)" type="application\/javascript"><\/script>.*',
    ))) {
      final index = content.indexOf('</body>');
      content = content.replaceRange(
        index,
        index + '</body>'.length,
        '<script src="main.dart.js?version=0.0.1&build_number=1" type="application/javascript"></script>\n</body>',
      );
    }

    await indexHtml.writeAsString(content);
  }
}
