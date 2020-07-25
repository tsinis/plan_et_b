import 'package:flare_flutter/flare_cache.dart' show FlareCache;
import 'package:flutter/material.dart' show MaterialApp;
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'helpers/audio_player.dart';
import 'screens/game_screen.dart';
import 'screens/info_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // This is required for Rive animations preCache,
  FlareCache.doesPrune = false; // and this one too, before pre-caching.
  Game.preCache; // Rive animation pre-caching itself.
  AudioPlayer.preCache; // Opening audio asset, so we can play them later in game.
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      // Locking orientation on mobile devices.
      .whenComplete(() => runApp(Phoenix(child: const MyApp()))); // We will need Phoenix to animation state reset.
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  // NavKey will be later used for access to main screen context (showing dialog), since Rive is managing state in this app.
  Widget build(BuildContext context) => MaterialApp(navigatorKey: Game.navKey, home: const InfoScreen());
}
