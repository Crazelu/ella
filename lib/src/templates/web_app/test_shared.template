import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void emulateDesktopScreenSize(
  WidgetTester tester, {
  double width = 995,
  double height = 1600,
}) {
  final dpi = tester.view.devicePixelRatio;
  tester.view.physicalSize = Size(width * dpi, height * dpi);
}
