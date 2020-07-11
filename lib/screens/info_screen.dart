import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cyber_flutter/theme/colors.dart';
import 'package:cyber_flutter/widgets/cyber_button.dart';
import 'package:flutter/cupertino.dart' show CupertinoPageRoute;
import 'package:flutter/material.dart';
import 'package:sa_stateless_animation/sa_stateless_animation.dart';

import '../helpers/glitch_extension.dart';
import 'game_screen.dart';

class InfoScreen extends StatelessWidget {
  InfoScreen({Key key}) : super(key: key);

  final AssetsAudioPlayer _musicAudioPlayer = AssetsAudioPlayer.withId('music_player');
  @override
  Widget build(BuildContext context) {
    bool _isSmartPhone = MediaQuery.of(context).size.width > MediaQuery.of(context).size.height * 1.25;

    _musicAudioPlayer.open(Audio('assets/audio/cubedcanada+invaderloop.mp3'),
        loopMode: LoopMode.single, autoStart: false, volume: 0.33, respectSilentMode: true, showNotification: false);

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
          PlayAnimation<double>(
            tween: Tween<double>(begin: 0.1, end: 1.0),
            duration: const Duration(seconds: 1),
            builder: (context, child, value) => Transform.scale(scale: value, child: child),
            child: Opacity(
              opacity: 0.9,
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: 0.85,
                  heightFactor: 0.8,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(color: CyberColor.lightGray, width: 4),
                          bottom: BorderSide(color: CyberColor.lightGray, width: 4)),
                      gradient: RadialGradient(
                          center: Alignment(-0.6, -0.5),
                          radius: 0.1,
                          colors: <Color>[Color(0x4d084e79), Color(0x40032331)],
                          stops: <double>[0.9, 1.0]),
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
                              child: Opacity(opacity: 0.75, child: const Text('Plan-et-B', maxLines: 1).glitchText)),
                          Opacity(
                            opacity: 0.66,
                            child: AutoSizeText(
                                "2077y ...the world is divided. Since 2020, there have been tremendous changes in social order. The countries have lost their geopolitical influence because of internal problems, so they have ceased efforts to change the climate on Earth. It's becoming impossible to live here, your mission is find a new planet (Planet B). Unfortunately, you have a limited amount of fuel.",
                                maxLines: _isSmartPhone ? 6 : 11,
                                minFontSize: 11,
                                style: FontEnchantments.text,
                                textAlign: TextAlign.center),
                          ),
                          const CyberOkButton(),
                          Flexible(
                            child: AutoSizeText(
                                "Move aim to look around, press to determine a planet's suitability for life. There is a dozen planets to check.",
                                maxLines: _isSmartPhone ? 2 : 4,
                                minFontSize: 11,
                                style: FontEnchantments.text,
                                textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 12,
            left: 12,
            right: 12,
            child: LoopAnimation<double>(
              tween: Tween<double>(begin: 0.3, end: 0.8),
              duration: const Duration(seconds: 3),
              curve: Curves.easeOut,
              builder: (context, child, value) => Opacity(opacity: value, child: child),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    iconSize: 40.0,
                    padding: const EdgeInsets.all(12.0),
                    color: const Color(0x9909cad9),
                    tooltip: 'About',
                    icon: const Icon(Icons.info_outline),
                    onPressed: () => showDialog<void>(
                        context: context,
                        builder: (BuildContext context) => const Dialog(child: CyberOkButton(about: true))),
                  ),
                  IconButton(
                      iconSize: 40.0,
                      padding: const EdgeInsets.all(12.0),
                      color: const Color(0xFF09cad9),
                      tooltip: 'Play/Stop Music. There is short delay, please wait for it',
                      icon: const Icon(Icons.music_note),
                      onPressed: _musicAudioPlayer.playOrPause),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CyberOkButton extends StatelessWidget {
  const CyberOkButton({Key key, this.about = false}) : super(key: key);
  final bool about;
  @override
  Widget build(BuildContext context) => CyberButton(
        child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 13.0, top: 8.0, bottom: 8.0),
            child: Text('OK', style: FontEnchantments.displayClean.copyWith(fontSize: 16))),
        onPressed: () => about
            ? Navigator.pop(context)
            : Navigator.push(
                context, CupertinoPageRoute<Route>(fullscreenDialog: true, builder: (context) => const MainScreen())),
      );
}
