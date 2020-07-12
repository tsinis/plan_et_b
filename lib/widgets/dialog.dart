import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helpers/glitch_extension.dart';
import 'attribution.dart';
import 'button.dart';

class CyberDialog extends StatelessWidget {
  const CyberDialog({Key key, this.finalScore = 0, this.about = false}) : super(key: key);

  final int finalScore;
  final bool about;

  @override
  Widget build(BuildContext context) => AlertDialog(
        scrollable: about,
        shape: const BeveledRectangleBorder(
            side: BorderSide(color: Colors.blueGrey), borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0))),
        contentTextStyle: FontEnchantments.text,
        titleTextStyle: FontEnchantments.displayClean.copyWith(fontSize: 26.0, letterSpacing: 4.0),
        backgroundColor: about ? Colors.black87 : const Color(0x40032331),
        title: Text(about ? 'About' : 'Final Score', textAlign: TextAlign.center),
        content: about ? const _AboutContent() : _ScoreContent(finalScore),
      );
}

class _ScoreContent extends StatelessWidget {
  const _ScoreContent(this._finalScore, {Key key}) : super(key: key);

  final int _finalScore;

  @override
  Widget build(BuildContext context) => RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'You have checked $_finalScore/12 planets but:\n\n',
          style: FontEnchantments.text,
          children: <TextSpan>[
            TextSpan(
                text: "There is no planet B!\nSo let's take care of this one.\n\n",
                style: FontEnchantments.text.copyWith(color: const Color(0xFFffdd00), fontSize: 24.0)),
            TextSpan(
                text: 'Press F5 to play again', style: FontEnchantments.text.copyWith(color: const Color(0xFFc0c0c0))),
          ],
        ),
      );
}

class _AboutContent extends StatelessWidget {
  const _AboutContent({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            mouseCursor: MaterialStateMouseCursor.clickable,
            onTap: () => launch('https://github.com/tsinis/plan_et_b'),
            child: RichText(
              maxLines: 10,
              text: TextSpan(
                style: FontEnchantments.text.copyWith(fontSize: 16.0),
                children: <TextSpan>[
                  const TextSpan(
                      text:
                          'This is the updated version of my award-winning project, in the Official international Flutter Community Hackaton called "#Hack20". '),
                  TextSpan(
                      text: 'More info and the code, can be found here.',
                      style: FontEnchantments.text.copyWith(
                          decoration: TextDecoration.underline, color: Colors.lightBlueAccent, fontSize: 16.0)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Attributions',
            maxLines: 1,
            textAlign: TextAlign.center,
            style: FontEnchantments.displayClean.copyWith(fontSize: 18.0, color: Colors.cyanAccent),
          ),
          Text(
            'Assets used in this project (with CC 3.0 licenses) are:',
            maxLines: 4,
            textAlign: TextAlign.center,
            style: FontEnchantments.text.copyWith(fontSize: 16.0, color: Colors.blueGrey[300]),
          ),
          ...attributions,
          const CyberButton(text: 'Back')
        ],
      );
}
