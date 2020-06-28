import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/rendering.dart';

import 'package:flutter/widgets.dart';

class GameControls extends StatelessWidget {
  final void Function(dynamic) onExit, onEnter, onHover;
  final void Function() onTap;
  const GameControls(
      {Key key,
      @required this.onExit,
      @required this.onEnter,
      @required this.onTap,
      @required this.onHover,
      @required this.child})
      : super(key: key);

  final Stack child;
  static bool get _isSmartphone {
    if (kIsWeb) {
      return false;
    } else {
      return (Platform.isAndroid || Platform.isIOS) ? true : false;
    }
  }

  @override
  Widget build(BuildContext context) => _isSmartphone
      ? GestureDetector(
          child: child,
          onDoubleTap: onTap,
          onPanEnd: onExit,
          onPanStart: onEnter,
          onPanUpdate: onHover)
      : MouseRegion(
          child: GestureDetector(child: child, onTap: onTap),
          cursor: SystemMouseCursors.none,
          onExit: onExit,
          onEnter: onEnter,
          onHover: onHover);
}
