import 'package:flare_flutter/asset_provider.dart' show AssetProvider;
import 'package:flare_flutter/flare_actor.dart' show FlareActor;
import 'package:flare_flutter/provider/asset_flare.dart' show AssetFlare;
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';

import '../helpers/audio_player.dart';
import '../helpers/platform_detector.dart';
import '../rive/ik_controller.dart';
import '../rive/pseudo3D_widget.dart';

class Game extends StatefulWidget {
  const Game({Key navKey}) : super(key: navKey);
  static final navKey = GlobalKey<NavigatorState>();

  static AssetProvider cache = AssetFlare(bundle: rootBundle, name: 'assets/animations/background.flr');

  AssetProvider get _cache => cache;

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> with SingleTickerProviderStateMixin {
  Animation<double> _pseudo3D, _depth;
  AnimationController _hudController;
  final IKController _ikController = IKController();
  double _point = 0.0, _turn = 0.0;

  @override
  void initState() {
    RivePseudo3DRenderObject.score = 0;
    super.initState();
    _hudController = AnimationController(duration: const Duration(milliseconds: 500), vsync: this)
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
      child: GameControls(
        onTap: () {
          AudioPlayer.playSound;
          setState(() => _ikController.detecting = true);
        },
        onHover: (dynamic _moveOver) {
          _point += _moveOver.delta.dy * (0.1 / _size.height) as num;
          _turn -= _moveOver.delta.dx * (0.1 / _size.width) as num;
          setState(() => _ikController
              .moveAim(Offset((_moveOver.localPosition.dx) as double, (_moveOver.localPosition.dy) as double)));
        },
        onExit: (dynamic _details) {
          _pseudo3D = Tween<double>(
            begin: 1.0,
            end: 0.0,
          ).animate(_hudController);
          _depth = Tween<double>(
            begin: 1.0,
            end: 0.0,
          ).animate(
            CurvedAnimation(parent: _hudController, curve: const Cubic(0.5, 0, 0.25, 1.0)),
          );
          _hudController.forward();
          setState(() => _ikController.moveAim(Offset(_size.width / 2, _size.height / 2)));
        },
        onEnter: (dynamic _details) {
          _pseudo3D = null;
          _depth = Tween<double>(
            begin: 1.0,
            end: 0.0,
          ).animate(
            CurvedAnimation(parent: _hudController, curve: const Cubic(1.0, 0.0, 1.0, 1.0)),
          );
          _hudController.reverse();
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: FlareActor.asset(widget._cache, animation: 'game', controller: _ikController),
            ),
            Positioned.fill(
              child: RivePseudo3DWidget(point: _point, turn: _turn, depth: _depth?.value ?? 0.0),
            ),
          ],
        ),
      ),
    );
  }
}
