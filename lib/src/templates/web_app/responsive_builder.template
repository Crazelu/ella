import 'package:flutter/material.dart';

const _breakpoint = 992;

extension ResponsiveBuilderExt<T> on (T, T) {
  T get resolve => ResponsiveBuilder(desktop: this.$1, mobile: this.$2).resolve;
}

class ResponsiveBuilder<T> {
  final T desktop;
  final T? mobile;

  ResponsiveBuilder({
    required this.desktop,
    this.mobile,
  });

  T get resolve {
    final data = MediaQueryData.fromView(
      WidgetsBinding.instance.platformDispatcher.views.first,
    );
    if (mobile == null) return desktop;
    final size = data.size;
    if (size.width <= _breakpoint) return mobile!;
    return desktop;
  }
}

class ResponsiveWidgetBuilder extends StatelessWidget {
  final Widget desktop;
  final Widget? mobile;

  const ResponsiveWidgetBuilder({
    super.key,
    required this.desktop,
    this.mobile,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (mobile == null) return desktop;
        if (constraints.maxWidth <= _breakpoint) return mobile!;
        return desktop;
      },
    );
  }
}
