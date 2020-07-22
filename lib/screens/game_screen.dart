import 'dart:math' show max;

import 'package:flare_flutter/asset_provider.dart' show AssetProvider;
import 'package:flare_flutter/flare_actor.dart' show FlareActor;
import 'package:flare_flutter/flare_cache.dart' show cachedActor;
import 'package:flare_flutter/provider/asset_flare.dart' show AssetFlare;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../helpers/audio_player.dart';
import '../helpers/platform_detector.dart';
import '../rive/cockpit_control.dart';
import '../rive/ik_controller.dart';
import '../widgets/info_bar.dart';

class Game extends StatefulWidget {
  const Game({Key navKey}) : super(key: navKey);

  static final navKey = GlobalKey<NavigatorState>();

  static final AssetProvider _riveAsset = AssetFlare(bundle: rootBundle, name: 'assets/animations/Cockpit.flr');

  @override
  _GameState createState() => _GameState();

  static Future<void> get preCache async => await cachedActor(_riveAsset);

  AssetProvider get cache => _riveAsset;
}

class _GameState extends State<Game> with SingleTickerProviderStateMixin {
  bool _barDissmised = true;
  Animation<double> _pseudo3D, _depth;
  AnimationController _hudController;
  final IKController _ikController = IKController();
  double _point = 0.0, _turn = 0.0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    CockpitControl.score = 0;
    AudioPlayer.playVoice;
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

  double get _infoBarWidth => (_screenSize.width > 800) ? _screenSize.width / 3 : max(_screenSize.width / 1.5, 300.0);

  Size get _screenSize => MediaQuery.of(context).size;

  void get _detect {
    AudioPlayer.playSound;
    setState(() => _ikController.detecting = true);
    if (_barDissmised) {
      _barDissmised = false;
      Future<dynamic>.delayed(
        const Duration(seconds: 1),
        () => _scaffoldKey.currentState.showSnackBar(
          SnackBar(
              shape: const BeveledRectangleBorder(
                  side: BorderSide(color: Colors.blueGrey),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(5.0),
                      bottomRight: Radius.circular(10.0))),
              backgroundColor: const Color(0x4d084e79),
              content: const DetectorInfo(),
              width: _infoBarWidth,
              behavior: SnackBarBehavior.floating,
              duration: const Duration(milliseconds: 1400)),
        ),
      ).whenComplete(() => _barDissmised = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      body: GameControls(
        onTap: () => _detect,
        onHover: (dynamic _moveOver) {
          _point += _moveOver.delta.dy * (0.1 / _screenSize.height) as num;
          _turn -= _moveOver.delta.dx * (0.1 / _screenSize.width) as num;
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
          setState(() => _ikController.moveAim(Offset(_screenSize.width / 2, _screenSize.height / 2)));
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
            Positioned.fill(child: FlareActor.asset(widget.cache, animation: 'game', controller: _ikController)),
            Positioned.fill(child: AnimatedHUD(point: _point, turn: _turn, depth: _depth?.value ?? 0.0))
          ],
        ),
      ),
    );
  }
}
