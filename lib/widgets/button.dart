import 'package:flutter/cupertino.dart' show CupertinoPageRoute;
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import '../helpers/audio_player.dart';

import '../helpers/glitch_extension.dart';
import '../rive/cockpit_control.dart';
import '../screens/game_screen.dart';

// This futuristic looking button will be used in game few times, so according to
// DRY principle it will be written just once and used on every screen (as a Cyber Dialog).
class CyberButton extends StatelessWidget {
  const CyberButton({Key key, this.text = 'Back'}) : super(key: key);

  final String text; // The text that will be shown on button.

  // What will happen when user is pressing on that button.
  void _pressButton(BuildContext context) {
    switch (text) {
      case 'Play': // If we are at the main menu, then start the game.
        {
          Navigator.pushReplacement(
              context, CupertinoPageRoute<Route>(fullscreenDialog: true, builder: (_) => const Game()));
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
          CockpitControl.resetScore(); // Reset score, then
          Phoenix.rebirth(context); // reset animations state, so it will start over again and,
          Navigator.pop(context); // finally hide Score Dialog.
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) => InkWell(
        enableFeedback: false,
        autofocus: true, // So we can just press the button with a Space-bar for example.
        splashColor: Colors.transparent, // Buggy at web ATM.
        onTap: () => _pressButton(context),
        child: Material(
          clipBehavior: Clip.antiAlias,
          color: Colors.black38,
          shape: const BeveledRectangleBorder(
              // Futuristic look.
              side: BorderSide(color: Colors.cyanAccent),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 12, left: 40, right: 42),
            child: Text(text,
                style: FontEnchantments.displayClean.copyWith(fontSize: 14, color: Colors.white70),
                textAlign: TextAlign.center),
          ),
        ),
      );
}
