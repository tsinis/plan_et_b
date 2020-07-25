import 'package:flutter/cupertino.dart' show CupertinoPageRoute;
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import '../helpers/audio_player.dart';

import '../helpers/glitch_extension.dart';
import '../rive/cockpit_control.dart';
import '../screens/game_screen.dart';

class CyberButton extends StatelessWidget {
  const CyberButton({Key key, this.text = 'Back'}) : super(key: key);

  final String text; // The text that will be shown on button.

  void _pressButton(BuildContext context) {
    switch (text) {
      case 'Play': // If we are at the main menu, then start the game.
        {
          Navigator.push(context, CupertinoPageRoute<Route>(fullscreenDialog: true, builder: (_) => const Game()));
        }
        break;
      case 'Back': // If we are at the About dialog, then just return to main menu.
        {
          Navigator.pop(context);
        }
        break;
      default: // If it's a Score dialog, then just start game again.
        {
          AudioPlayer.restartVoice;
          CockpitControl.resetScore();
          Phoenix.rebirth(context); // Resetting animations state, so it will start over again.
          Navigator.pop(context);
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) => InkWell(
      enableFeedback: false,
      autofocus: true, // So we can just press the button with a Space-bar for example.
      splashColor: Colors.transparent, // Buggy at web ATM.
      child: Material(
        clipBehavior: Clip.antiAlias,
        color: Colors.black38,
        shape: const BeveledRectangleBorder(
            // Futuristic look.
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
