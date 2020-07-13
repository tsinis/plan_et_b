import 'package:flare_flutter/flare_cache.dart' show FlareCache, cachedActor;
import 'package:flutter/material.dart' show MaterialApp;
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

import 'helpers/audio_player.dart';
import 'screens/game_screen.dart';
import 'screens/info_screen.dart';

Future<void> get _cacheGame async => await cachedActor(MainScreen.cache);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlareCache.doesPrune = false;
  _cacheGame;
  AudioPlayer.cacheAudio;
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .whenComplete(() => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      MaterialApp(debugShowCheckedModeBanner: false, navigatorKey: MainScreen.navKey, home: InfoScreen());
}
