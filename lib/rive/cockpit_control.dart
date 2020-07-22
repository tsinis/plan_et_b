import 'package:flare_dart/math/aabb.dart' show AABB;
import 'package:flare_dart/math/mat2d.dart' show Mat2D;
import 'package:flare_flutter/asset_provider.dart' show AssetProvider;
import 'package:flare_flutter/flare.dart' show ActorAnimation, ActorNode, FlutterActor;
import 'package:flare_flutter/flare_render_box.dart' show FlareRenderBox;
import 'package:flare_flutter/provider/asset_flare.dart' show AssetFlare;
import 'package:flutter/material.dart' show showDialog;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';

import '../screens/game_screen.dart';
import '../widgets/dialog.dart';
import 'hud_control.dart';

class AnimatedHUD extends LeafRenderObjectWidget {
  const AnimatedHUD({
    Key key,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.point,
    this.turn,
    this.depth,
  }) : super(key: key);

  final Alignment alignment;
  final double point, turn, depth;
  final BoxFit fit;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return CockpitControl()
      ..fit = fit
      ..alignment = alignment
      ..point = point
      ..turn = turn
      ..pseudo3DDepth = depth;
  }

  @override
  void didUnmountRenderObject(covariant CockpitControl _renderObject) => _renderObject.dispose();

  @override
  void updateRenderObject(BuildContext context, covariant CockpitControl renderObject) {
    renderObject
      ..fit = fit
      ..alignment = alignment
      ..point = point
      ..turn = turn
      ..pseudo3DDepth = depth;
  }
}

class CockpitControl extends FlareRenderBox {
  static ActorNode ikTarget;
  static int score = 0;

  final BuildContext context = Game.navKey.currentState.overlay.context;
  double point, turn, pseudo3DDepth;

  static double _animationTime = 0;
  static bool _scoreShowing = false;

  Pseudo3dHudArtboard _artboard;
  final AssetProvider _hudAnimation = AssetFlare(bundle: rootBundle, name: 'assets/animations/HUD.flr');
  ActorAnimation _foregroundLoop, _loadUI;

  @override
  bool get isPlaying => true;

  @override
  AABB get aabb => _artboard?.artboardAABB();

  @override
  void advance(double elapsed) {
    if (_artboard == null) {
      return;
    }
    if (_animationTime >= _loadUI.duration && _scoreShowing == false) {
      _scoreDialog();
    }
    _animationTime += elapsed;
    _foregroundLoop?.apply(_animationTime % _foregroundLoop.duration, _artboard, 1.0);
    _loadUI?.apply(_animationTime, _artboard, 1.0);
    _artboard.setPseudo3D(point, turn, pseudo3DDepth);
    _artboard.advance(elapsed);
  }

  @override
  void load() {
    super.load();
    loadFlare(_hudAnimation).then(
      (FlutterActor _actor) {
        Pseudo3dHudArtboard artboard = Pseudo3dHudActor.instanceArtboard(_actor);
        artboard.initializeGraphics();
        _artboard = artboard;
        _foregroundLoop = _artboard.getAnimation('foreground');
        _loadUI = _artboard.getAnimation('load_ui');
        ikTarget = _artboard.getNode('view_control');
        _artboard.advance(0.0);
        markNeedsPaint();
      },
    );
  }

  @override
  void paintFlare(Canvas canvas, Mat2D viewTransform) => _artboard.draw(canvas);

  void _scoreDialog() {
    _scoreShowing = true;
    showDialog<void>(
        barrierDismissible: false,
        useRootNavigator: false,
        context: context,
        builder: (_) => CyberDialog(finalScore: score));
  }

  static void resetScore() {
    _animationTime = 0;
    score = 0;
    _scoreShowing = false;
  }

  static void increaseScore() => score++;
}
