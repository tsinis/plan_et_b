import 'package:flare_flutter/flare_cache.dart' show FlareCache, cachedActor;
import 'package:flutter/material.dart' show MaterialApp;
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

import 'game_screen.dart';
import 'info_screen.dart';

Future<void> _cacheGame() async => await cachedActor(MainScreen.cache);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlareCache.doesPrune = false;
  _cacheGame();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .whenComplete(() => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: MainScreen.navKey,
      home: InfoScreen());
}
