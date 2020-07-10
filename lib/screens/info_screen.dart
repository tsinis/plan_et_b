import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart' show CupertinoPageRoute;
import 'package:flutter/material.dart';

import '../helpers/glitch_extension.dart';
import 'game_screen.dart';

class InfoScreen extends StatelessWidget {
  InfoScreen({Key key}) : super(key: key);

  final AssetsAudioPlayer _musicAudioPlayer = AssetsAudioPlayer();

  @override
  Widget build(BuildContext context) {
    bool _smartPhone = MediaQuery.of(context).size.width > MediaQuery.of(context).size.height * 1.25;

    _musicAudioPlayer.open(Audio('assets/audio/cubedcanada+invaderloop.mp3'),
        autoStart: false, volume: 0.33, respectSilentMode: true, showNotification: false);

    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.topRight,
        children: [
          Opacity(
            opacity: 0.66,
            child: Image.asset('assets/images/StarfieldSimulation_rot.gif',
                fit: BoxFit.fill, filterQuality: FilterQuality.high),
          ),
          Opacity(
            opacity: 0.9,
            child: Center(
              child: FractionallySizedBox(
                widthFactor: 0.85,
                heightFactor: 0.8,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Color(0xFF084e79), width: 4),
                      bottom: BorderSide(color: Color(0xFF084e79), width: 4),
                    ),
                    gradient: RadialGradient(
                      center: Alignment(-0.5, -0.6),
                      radius: 0.15,
                      colors: <Color>[
                        Color(0xFF084e79),
                        Color(0xFF0e0108),
                      ],
                      stops: <double>[0.9, 1.0],
                    ),
                  ),
                  child: FractionallySizedBox(
                    widthFactor: 0.9,
                    heightFactor: 0.9,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Opacity(opacity: 0.66, child: const Text('Plan-et-B', maxLines: 1).glitchText)),
                        Opacity(
                          opacity: 0.66,
                          child: AutoSizeText(
                              "2077y ...the world is divided. Since 2020, there have been tremendous changes in social order. The countries have lost their geopolitical influence because of internal problems, so they have ceased efforts to change the climate on Earth. It's becoming impossible to live here, your mission is find a new planet (Planet B). Unfortunately, you have a limited amount of fuel.",
                              maxLines: _smartPhone ? 6 : 11,
                              minFontSize: 11,
                              style: FontEnchantments.text,
                              textAlign: TextAlign.center),
                        ),
                        RaisedButton(
                          color: const Color(0xFF084e79),
                          child: Text('OK', style: FontEnchantments.displayClean.copyWith(fontSize: 16)),
                          onPressed: () => Navigator.push(
                            context,
                            CupertinoPageRoute<Route>(fullscreenDialog: true, builder: (context) => const MainScreen()),
                          ),
                        ),
                        const Flexible(
                          child: AutoSizeText(
                            "Move aim to look around, press to determine a planet's suitability for life. There is a dozen planets to check.",
                            maxLines: 2,
                            minFontSize: 11,
                            style: FontEnchantments.text,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 1,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    iconSize: 40.0,
                    padding: const EdgeInsets.all(12.0),
                    color: const Color(0xFFffffff).withOpacity(0.5),
                    tooltip: 'About',
                    icon: const Icon(Icons.info_outline),
                    onPressed: null), //TODO Add About dialog.
                IconButton(
                    iconSize: 40.0,
                    padding: const EdgeInsets.all(12.0),
                    color: const Color(0xFFffffff).withOpacity(0.5),
                    tooltip: 'Play/Stop Music. There is short delay, please wait for it',
                    icon: const Icon(Icons.music_note),
                    onPressed: _musicAudioPlayer.playOrPause),
              ],
            ),
          )
        ],
      ),
    );
  }
}
