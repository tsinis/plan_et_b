import 'dart:ui';

import 'package:flutter/material.dart';

extension HoverExtensions on Widget {
  Widget get glitchText => _Glitch(child: this);
}

class _Glitch extends StatefulWidget {
  const _Glitch({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  _GlitchState createState() => _GlitchState();
}

class _GlitchState extends State<_Glitch> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _glitchAnimation;
  bool _stoped = false;

  @override
  void dispose() {
    super.dispose();
    _animationController?.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    _glitchAnimation = Tween(begin: 0.0, end: 3.0).animate(
        CurvedAnimation(curve: Curves.bounceInOut, reverseCurve: Curves.slowMiddle, parent: _animationController));

    _animationController.addStatusListener((AnimationStatus _status) {
      if (_status == AnimationStatus.completed && _stoped == false) {
        _animationController.reverse();
      } else if (_status == AnimationStatus.dismissed && _stoped == false) {
        _animationController.forward();
      }
    });
    _animationController.forward();
  }

  void _glitch() {
    _stoped = !_stoped;
    _stoped ? _animationController.reset() : _animationController.forward();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: _glitch,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) => Align(
            alignment: Alignment(_glitchAnimation.value / 250, _glitchAnimation.value / 200),
            child: Stack(
              children: [
                Positioned(
                    top: _glitchAnimation.value,
                    right: _glitchAnimation.value * 1.5,
                    child: _GlitchText(text: widget, color: Colors.cyan.withOpacity(0.85))),
                Positioned(
                    bottom: _glitchAnimation.value,
                    left: _glitchAnimation.value * 1.5,
                    child: _GlitchText(text: widget, color: Colors.pink.withOpacity(0.85))),
                Positioned(
                  bottom: _glitchAnimation.value,
                  left: _glitchAnimation.value,
                  child: BackdropFilter(
                      filter:
                          ImageFilter.blur(sigmaX: _glitchAnimation.value * 0.2, sigmaY: _glitchAnimation.value * 0.3),
                      child: _GlitchText(text: widget, color: Colors.white.withOpacity(0))),
                ),
                Opacity(
                    opacity: 1.7 - (0.7 + (_glitchAnimation.value) * 0.1).toDouble(),
                    child: _GlitchText(text: widget, color: Colors.grey[100])),
              ],
            ),
          ),
        ),
      );
}

class _GlitchText extends StatelessWidget {
  const _GlitchText({Key key, @required this.text, this.color}) : super(key: key);

  final Color color;
  final _Glitch text;

  @override
  Widget build(BuildContext context) =>
      DefaultTextStyle(child: text.child, style: Theme.of(context).textTheme.headline2.copyWith(color: color));
}
