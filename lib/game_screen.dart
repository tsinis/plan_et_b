import 'package:flare_flutter/flare_actor.dart' show FlareActor;
import 'package:flutter/widgets.dart';

import 'ik_controller.dart';
import 'pseudo3D_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MyMainScreenState createState() => _MyMainScreenState();
}

class _MyMainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> _pseudo3D, _depth;
  AnimationController _hudController;
  final IKController _ikController = IKController();
  double _point = 0.0, _turn = 0.0;

  @override
  void initState() {
    super.initState();

    _hudController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this)
      ..addListener(
        () => setState(
          () {
            if (_pseudo3D != null) {
              _point *= _pseudo3D.value;
              _turn *= _pseudo3D.value;
            }
          },
        ),
      );
    _hudController.forward(from: 1.0);
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      color: const Color(0xFF000000),
      child: GestureDetector(
        onPanUpdate: (DragUpdateDetails _drag) {
          _point += _drag.delta.dy * (1 / _size.height);
          _turn -= _drag.delta.dx * (1 / _size.width);
          setState(() => _ikController
              .moveAim(Offset(_drag.localPosition.dx, _drag.localPosition.dy)));
        },
        onPanEnd: (DragEndDetails _details) {
          _pseudo3D = Tween<double>(
            begin: 1.0,
            end: 0.0,
          ).animate(_hudController);
          _depth = Tween<double>(
            begin: 1.0,
            end: 0.0,
          ).animate(
            CurvedAnimation(
                parent: _hudController, curve: const Cubic(0.5, 0, 0.25, 1.0)),
          );
          _hudController.forward();
          setState(() =>
              _ikController.moveAim(Offset(_size.width / 2, _size.height / 2)));
        },
        onPanStart: (DragStartDetails _details) {
          _pseudo3D = null;
          _depth = Tween<double>(
            begin: 1.0,
            end: 0.0,
          ).animate(
            CurvedAnimation(
                parent: _hudController, curve: const Cubic(1.0, 0.0, 1.0, 1.0)),
          );
          _hudController.reverse();
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: FlareActor('assets/background.flr',
                  animation: 'game',
                  isPaused: false,
                  controller: _ikController),
            ),
            Positioned.fill(
              child: RivePseudo3DWidget(
                  point: _point, turn: _turn, depth: _depth?.value ?? 0.0),
            ),
          ],
        ),
      ),
    );
  }
}
