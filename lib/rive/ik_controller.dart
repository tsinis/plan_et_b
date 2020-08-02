import 'dart:ui';

import 'package:flutter/widgets.dart' show ValueNotifier;

import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flare_dart/math/mat2d.dart' show Mat2D;
import 'package:flare_dart/math/vec2d.dart' show Vec2D;

import 'cockpit_control.dart';

// Here you will need some advantage knowledge of Rive Controllers, please refer to official documentation at:
// https://pub.dev/documentation/flare_dart/latest

class IKController implements FlareController {
  bool detecting = false; // To prevent "scan spamming", there will be a "cooldown".

  double _animationTime = 0, _detectTime = 0; // So we can reset Game and Detect animations.
  ActorAnimation _backgroundLoop, _detect; // To set their parameters programmatically in code.

  // Inverse control related, so we can store/move HUD and Cockpit coordinates from pointer position.
  ActorNode _ikTarget;
  Offset _aimPosition; // A.k.a. pointer position, a.k.a touch position.
  Mat2D _viewTransform;

  @override
  ValueNotifier<bool> isActive;

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    if (_detectTime >= _detect.duration) {
      // If Detect animation is ended, reset it,
      _detectTime = 0;
      CockpitControl.increaseScore(); // increase Score by one,
      detecting = false; // so we can call Detect animation again.
    } else if (detecting) {
      // Otherwise if user clicked/tapped run Detect animation.
      _detectTime += elapsed;
      _detect?.apply(_detectTime, artboard, 1.0);
    }

    _animationTime += elapsed; // Track main Game animation time.

    // Run background animation in loop.
    _backgroundLoop?.apply(_animationTime % _backgroundLoop.duration, artboard, 1.0);

    // Track pointer position it exists.
    if (_ikTarget == null || _aimPosition == null || _viewTransform == null) {
      return false;
    }

    Mat2D inverseViewTransform = Mat2D();
    if (!Mat2D.invert(inverseViewTransform, _viewTransform)) {
      return true;
    }

    // Store pointer position.
    Vec2D worldTouch = Vec2D();
    Vec2D.transformMat2D(worldTouch, Vec2D.fromValues(_aimPosition.dx, _aimPosition.dy), inverseViewTransform);

    // Convert pointer position, so we can use it in animation.
    Mat2D inverseTargetWorld = Mat2D();
    if (!Mat2D.invert(inverseTargetWorld, _ikTarget.parent.worldTransform)) {
      return true;
    }

    Vec2D localTouchCoordinates = Vec2D();
    Vec2D.transformMat2D(localTouchCoordinates ?? Vec2D.fromValues(0, 0), worldTouch, inverseTargetWorld);

    // Apply converted coordinates to animation, to both HUD and main Game animations.
    CockpitControl.ikTarget.translation = _ikTarget.translation = localTouchCoordinates ?? Vec2D.fromValues(0, 0);
    return true;
  }

  // Grabbing all references from Rive animation, for use in runtime.
  @override
  void initialize(FlutterActorArtboard _artboard) {
    _ikTarget = _artboard.getNode('view_control');
    _backgroundLoop = _artboard.getAnimation('background');
    _detect = _artboard.getAnimation('detect');
  }

  void moveAim(Offset _offset) => _aimPosition = _offset;

  @override
  void setViewTransform(Mat2D _newViewTransform) => _viewTransform = _newViewTransform;
}
