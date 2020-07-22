import 'package:flutter/cupertino.dart' show CupertinoPageRoute;
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import '../helpers/audio_player.dart';

import '../helpers/glitch_extension.dart';
import '../rive/cockpit_control.dart';
import '../screens/game_screen.dart';

class CyberButton extends StatelessWidget {
  const CyberButton({Key key, this.text = 'Back'}) : super(key: key);

  final String text;

  void _pressButton(BuildContext context) {
    switch (text) {
      case 'Play':
        {
          Navigator.push(
              context, CupertinoPageRoute<Route>(fullscreenDialog: true, builder: (context) => const Game()));
        }
        break;
      case 'Back':
        {
          Navigator.pop(context);
        }
        break;
      default:
        {
          AudioPlayer.restartVoice;
          CockpitControl.resetScore();
          Phoenix.rebirth(context);
          Navigator.pop(context);
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) => InkWell(
      enableFeedback: false,
      autofocus: true,
      splashColor: Colors.transparent,
      child: Material(
        clipBehavior: Clip.antiAlias,
        color: Colors.black38,
        shape: const BeveledRectangleBorder(
            side: BorderSide(color: Colors.cyanAccent),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), bottomRight: Radius.circular(15.0))),
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 40.0, right: 42.0),
          child: Text(text,
              style: FontEnchantments.displayClean.copyWith(fontSize: 14, color: Colors.white70),
              textAlign: TextAlign.center),
        ),
      ),
      onTap: () => _pressButton(context));
}
