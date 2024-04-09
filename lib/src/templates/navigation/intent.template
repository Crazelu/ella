import 'package:flutter/widgets.dart';

class NavigationIntent {
  const NavigationIntent({
    this.route = "/",
    this.otherRoute = "",
    this.strategy = NavigationStrategy.push,
    this.args,
    this.navigatorKeyOverride,
  });

  final String route;
  final String otherRoute;
  final NavigationStrategy strategy;
  final Object? args;
  final GlobalKey<NavigatorState>? navigatorKeyOverride;
}

enum NavigationStrategy {
  push,
  pushAndRemoveUntil,
  pushReplacement,
  popAndPush,
  pop,
  popUntil,
  exitApp,
}
