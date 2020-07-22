import 'dart:ui' as ui;

import 'package:flare_dart/actor_artboard.dart';
import 'package:flare_dart/actor_image.dart';
import 'package:flare_dart/actor_shape.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flutter/widgets.dart';

class Pseudo3dHudActor extends FlutterActor {
  Pseudo3dHudActor(FlutterActor _source) {
    copyFlutterActor(_source);
  }

  @override
  ActorArtboard makeArtboard() => Pseudo3dHudArtboard(this);

  @override
  ActorImage makeImageNode() => _Pseudo3dHudActorImage();

  @override
  ActorShape makeShapeNode(ActorShape source) => _Pseudo3dHudActorShape();

  static Pseudo3dHudArtboard instanceArtboard(FlutterActor _source) {
    Pseudo3dHudActor pseudo3DActor = Pseudo3dHudActor(_source);
    return _source.artboard.makeInstanceWithActor(pseudo3DActor) as Pseudo3dHudArtboard;
  }
}

class Pseudo3dHudArtboard extends FlutterActorArtboard {
  Pseudo3dHudArtboard(FlutterActor _actor) : super(_actor);

  void setPseudo3D(double _point, double _roll, double _pseudo3DDepth) {
    Matrix4 _transform = Matrix4.identity();
    Matrix4 _perspective = Matrix4.identity()..setEntry(3, 2, 0.001);
    _transform.multiply(
      Matrix4.diagonal3Values(0.6, 0.6, 1.0),
    );
    _transform.multiply(_perspective);
    _transform.multiply(
      Matrix4.rotationY(_roll),
    );
    _transform.multiply(
      Matrix4.rotationX(_point),
    );

    List<dynamic> rootChildren = root.children;
    for (final _drawable in drawableNodes) {
      if (_drawable is _Pseudo3DDrawable) {
        ActorNode _topComponent = _drawable;
        int _index = 0;

        while (_topComponent != null) {
          if (_topComponent.parent == root) {
            _index = rootChildren.length - rootChildren.indexOf(_topComponent);
            break;
          }
          _topComponent = _topComponent.parent;
        }

        Matrix4 pseudo3DTransform = Matrix4.copy(_transform);
        // 3D depth can be changed here:
        pseudo3DTransform.multiply(Matrix4.translationValues(0, 0, -100 - _index * 25 * _pseudo3DDepth));
        (_drawable as _Pseudo3DDrawable).pseudo3DTransform = pseudo3DTransform;
      }
    }
  }
}

class _Pseudo3DDrawable {
  Matrix4 pseudo3DTransform;
}

class _Pseudo3dHudActorShape extends FlutterActorShape implements _Pseudo3DDrawable {
  @override
  Matrix4 pseudo3DTransform;

  @override
  void draw(ui.Canvas _canvas) {
    _canvas.save();
    _canvas.transform(pseudo3DTransform.storage);
    super.draw(_canvas);
    _canvas.restore();
  }
}

class _Pseudo3dHudActorImage extends FlutterActorImage implements _Pseudo3DDrawable {
  @override
  Matrix4 pseudo3DTransform;

  @override
  void draw(ui.Canvas _canvas) {
    _canvas.save();
    _canvas.transform(pseudo3DTransform.storage);
    super.draw(_canvas);
    _canvas.restore();
  }
}
