import 'package:flare_flutter/flare_cache.dart' show FlareCache;
import 'package:flutter/material.dart' show MaterialApp;
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'helpers/audio_player.dart';
import 'screens/game_screen.dart';
import 'screens/info_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlareCache.doesPrune = false;
  Game.preCache;
  AudioPlayer.preCache;
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .whenComplete(() => runApp(Phoenix(child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(navigatorKey: Game.navKey, home: const InfoScreen());
}
