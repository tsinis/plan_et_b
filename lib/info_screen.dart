import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart' show CupertinoPageRoute;
import 'package:flutter/material.dart' show Scaffold, RaisedButton, Tooltip;
import 'package:flutter/widgets.dart';

import 'game_screen.dart';

class InfoScreen extends StatelessWidget {
  InfoScreen({Key key}) : super(key: key);

  final AssetsAudioPlayer _musicAudioPlayer = AssetsAudioPlayer();

  @override
  Widget build(BuildContext context) {
    _musicAudioPlayer.open(
      Audio('assets/audio/Caves.ogg'),
      autoStart: false,
      volume: 0.05,
      playInBackground: PlayInBackground.disabledRestoreOnForeground,
      respectSilentMode: true,
      showNotification: false,
    );
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.8,
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
                  Color(0xFF560631),
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
                  Align(
                    alignment: Alignment.topRight,
                    child: Tooltip(
                      message: 'There is short delay, please wait for it.',
                      child: RaisedButton(
                          child: Text('Play/Stop Music',
                              style: MainScreen.textStyle(
                                  const Color(0xFF560631))),
                          onPressed: _musicAudioPlayer.playOrPause),
                    ),
                  ),
                  Flexible(
                    child: AutoSizeText.rich(
                      TextSpan(
                        text: 'Plan-et-B\n',
                        style:
                            MainScreen.textStyle(const Color(0xFFffdd00), 30.0),
                        children: [
                          TextSpan(
                            style: MainScreen.textStyle(),
                            text:
                                'Year 2077... world is divided. Since 2020, huge changes have taken place in a social order. Countries that lost their geo-political influence due to internal problems, stopped making efforts to change the climate on Earth. It becomes impossible to live here, you have to find a new planet (Planet B). Sadly, you have a limited amount of fuel.',
                          )
                        ],
                      ),
                      maxLines: 32,
                      textAlign: TextAlign.center,
                      textScaleFactor: 0.9,
                    ),
                  ),
                  RaisedButton(
                    color: const Color(0xFF084e79),
                    child: Text('OK', style: MainScreen.textStyle()),
                    onPressed: () => Navigator.push(
                      context,
                      CupertinoPageRoute<Route>(
                          fullscreenDialog: true,
                          builder: (context) => const MainScreen()),
                    ),
                  ),
                  Flexible(
                    child: AutoSizeText(
                      "Move aim to look around, press to determine a planet's suitability for life. There is a 20 planets to check.",
                      style: MainScreen.textStyle(),
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
