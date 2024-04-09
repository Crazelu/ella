import 'package:flutter_dialog_manager/flutter_dialog_manager.dart';
import 'package:flutter/widgets.dart';

///An abstraction of [DialogManager] with no direct dependence on [BuildContext]
abstract class DialogHandler {
  GlobalKey get dialogKey;

  /// Displays a dialog on screen.
  ///
  /// [routeName] is used to look up a dialog's implementation.
  ///
  /// [autoDismiss] when true, implies that the dialog will be shown on screen for [duration]
  /// before being automatically dismissed.
  ///
  /// [barrierColor] -> Barrier colors of dialog. Defaults to [Colors.black38].
  ///
  /// [opaque] when true implies that [barrierColor] will take effect.
  /// Otherwise, barrier will be transparent.
  /// This might be helpful when there are multiple dialogs stacked on top of each other.
  Future<Object?> showDialog(
    String routeName, {
    Duration duration = const Duration(seconds: 3),
    bool autoDismiss = false,
    Object? arguments,
    bool opaque = true,
    Color? barrierColor,
  });

  ///Dismisses current dialog
  void dismissDialog([Object? result]);
}

class DialogHandlerImpl implements DialogHandler {
  DialogHandlerImpl({GlobalKey? dialogKey}) {
    _dialogKey = dialogKey ?? GlobalKey();
  }
  late GlobalKey _dialogKey;

  @override
  GlobalKey get dialogKey => _dialogKey;

  @override
  void dismissDialog([Object? result]) {
    DialogManager.of(dialogKey.currentContext!).dismissDialog(result);
  }

  @override
  Future<Object?> showDialog(
    String routeName, {
    Duration duration = const Duration(milliseconds: 1500),
    bool autoDismiss = false,
    Object? arguments,
    bool opaque = true,
    Color? barrierColor,
  }) async {
    return DialogManager.of(dialogKey.currentContext!).showDialog(
      routeName: routeName,
      duration: duration,
      autoDismiss: autoDismiss,
      opaque: opaque,
      barrierColor: barrierColor,
      arguments: arguments,
    );
  }
}
