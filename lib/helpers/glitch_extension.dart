import 'dart:ui';

import 'package:flutter/material.dart';

// Custom Fonts for futuristic looking UI.

extension FontEnchantments on Widget {
  Widget get glitchText => _Glitch(child: this);
  // Glitchy Display font for headlines.
  static const displayGlitch = TextStyle(fontFamily: 'Corruptor LDR', fontSize: 42, color: Color(0xFFffffff));
  // Clean version of that same Display font, so we can switch between them on tap.
  static const displayClean = TextStyle(fontFamily: 'Corruptor Clean LDR', fontSize: 42, color: Color(0xFFffffff));
  // Sci-fi text font, more readable then Display one, used in long texts.
  static const text = TextStyle(fontFamily: 'Polentical Neon', fontSize: 22, color: Color(0xFFc0c0c0));
}

// Extension with glitch animation (with onTap func.).
class _Glitch extends StatefulWidget {
  const _Glitch({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  _GlitchState createState() => _GlitchState();
}

// Standard tween animation will be used in loop here.
class _GlitchState extends State<_Glitch> with SingleTickerProviderStateMixin {
  static bool stopped = false; // We will track state of animation, so it can show clean font without glitch effect.

  // Standard references for built-in Flutter animations.
  AnimationController _animationController;
  Animation<double> _glitchAnimation;

  // Don't store animation controller if there are not widgets to animate.
  @override
  void dispose() {
    super.dispose();
    _animationController?.dispose();
  }

  // Describe animation:
  @override
  void initState() {
    super.initState();
    // time,
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));
    // and behavior (reverse animation will be smoother).
    _glitchAnimation = Tween(begin: 1.0, end: 3.0).animate(
        CurvedAnimation(curve: Curves.bounceInOut, reverseCurve: Curves.slowMiddle, parent: _animationController));

    // Listen and loop animation it with different curves on forward/reverse, stop animation on user's tap/click.
    _animationController.addStatusListener(
      (AnimationStatus _status) {
        if (_status == AnimationStatus.completed && stopped == false) {
          _animationController.reverse();
        } else if (_status == AnimationStatus.dismissed && stopped == false) {
          _animationController.forward();
        }
      },
    );
    _animationController.forward(); // Run glitch effect animation.
  }

  // Function to stop/run glitch effect.
  void _glitch() {
    // If stopped - show glitch effect, otherwise hide glitch effect.
    stopped = !stopped;
    // If not showing -- reset controller to 0, otherwise run from around 70%, so glitch effect "pop out" noticeably.
    stopped ? _animationController.reset() : _animationController.forward(from: 0.7);
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
                // Cyan transparent glitch, showing behind text, offset to upper right a bit.
                Positioned(
                    top: _glitchAnimation.value,
                    right: _glitchAnimation.value * 1.5,
                    child: _GlitchText(text: widget, color: Colors.cyan.withOpacity(0.85))),
                // Pink transparent glitch, showing behind text, offset to bottom left a bit.
                Positioned(
                    bottom: _glitchAnimation.value,
                    left: _glitchAnimation.value * 1.5,
                    child: _GlitchText(text: widget, color: Colors.pink.withOpacity(0.85))),
                // Blur effect for pink and cyan glitches.
                Positioned(
                  bottom: _glitchAnimation.value,
                  left: _glitchAnimation.value,
                  child: BackdropFilter(
                      filter:
                          ImageFilter.blur(sigmaX: _glitchAnimation.value * 0.2, sigmaY: _glitchAnimation.value * 0.3),
                      child: _GlitchText(text: widget, color: Colors.white.withOpacity(0))),
                ),
                // Main text itself, becomes a little bit  more transparent at the very peak of the animation.
                Opacity(
                    opacity: 1.7 - (0.7 + (_glitchAnimation.value) * 0.1).toDouble(),
                    child: _GlitchText(text: widget, color: Colors.grey[100])),
              ],
            ),
          ),
        ),
      );
}

// Helper class, so as not to write the same code several times.
class _GlitchText extends StatelessWidget {
  const _GlitchText({Key key, @required this.text, this.color}) : super(key: key);

  final Color color;
  final _Glitch text;

  @override
  Widget build(BuildContext context) => DefaultTextStyle(
      child: text.child,
      style: _GlitchState.stopped
          ? FontEnchantments.displayClean.copyWith(color: color)
          : FontEnchantments.displayGlitch.copyWith(color: color));
}
