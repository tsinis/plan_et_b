import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helpers/glitch_extension.dart';
import 'attribution.dart';
import 'button.dart';

// Dialog will be used here two times, for About info and final Score.
class CyberDialog extends StatelessWidget {
  const CyberDialog({Key key, this.finalScore}) : super(key: key);

  final int finalScore;

  bool get _about => finalScore == null; // If score is not passed here -- it's About dialog.

  @override
  Widget build(BuildContext context) => AlertDialog(
        scrollable: true,
        shape: const BeveledRectangleBorder(
            // Futuristic shape with "cut-out" corners.
            side: BorderSide(color: Colors.blueGrey),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(40), bottomRight: Radius.circular(20))),
        contentTextStyle: FontEnchantments.text,
        titleTextStyle: FontEnchantments.displayClean.copyWith(fontSize: 26, letterSpacing: 4),
        backgroundColor: _about ? Colors.black87 : const Color(0x40032331),
        title: Text(_about ? 'About' : 'Final Score', textAlign: TextAlign.center),
        content: _about ? const _AboutContent() : _ScoreContent(finalScore),
      );
}

// Score Dialog content.
class _ScoreContent extends StatelessWidget {
  const _ScoreContent(this._finalScore, {Key key}) : super(key: key);

  @required
  final int _finalScore;

  String get _scoreText => (_finalScore > 11)
      ? 'You have checked all planets but,\n\n'
      : 'You have checked $_finalScore/12 planets but,\n\n';

  String get _planetBText => (_finalScore > 11)
      ? "there is no planet B!\nSo let's take care of this one.\n"
      : "didn't find a Planet B suitable for life.\nTry once more.\n";

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: _scoreText,
                style: FontEnchantments.text,
                children: [
                  TextSpan(
                      text: _planetBText,
                      style: FontEnchantments.text.copyWith(color: const Color(0xFFffdd00), fontSize: 24))
                ],
              ),
            ),
          ),
          const CyberButton(text: 'Play Again')
        ],
      );
}

// About Dialog content.
class _AboutContent extends StatelessWidget {
  const _AboutContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            mouseCursor: MaterialStateMouseCursor.clickable,
            onTap: () => launch('https://github.com/tsinis/plan_et_b'),
            child: RichText(
              maxLines: 10,
              text: TextSpan(
                style: FontEnchantments.text.copyWith(fontSize: 16),
                children: <TextSpan>[
                  const TextSpan(
                      text:
                          'This is the updated version of my award-winning project, in the Official international Flutter Community Hackaton called "#Hack20". '),
                  TextSpan(
                      text: 'More info and the code, can be found here.',
                      style: FontEnchantments.text
                          .copyWith(decoration: TextDecoration.underline, color: Colors.lightBlueAccent, fontSize: 16)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: Text('Attributions',
                maxLines: 1, style: FontEnchantments.displayClean.copyWith(fontSize: 18, color: Colors.cyanAccent)),
          ),
          Center(
            child: Text('Assets used in this project (with CC 3.0 licenses) are:',
                maxLines: 4, style: FontEnchantments.text.copyWith(fontSize: 16, color: Colors.blueGrey[300])),
          ),
          ...attributions, // Show List of all attributions here.
          const Center(child: Padding(padding: EdgeInsets.all(10), child: CyberButton()))
        ],
      );
}
