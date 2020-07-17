import 'dart:math' show Random;

import 'package:flutter/material.dart';

import '../helpers/glitch_extension.dart';

final Random _randomGen = Random();
int get _random => _randomGen.nextInt(20);

class DetectorInfo extends StatelessWidget {
  const DetectorInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Oxygen: ',
          style: FontEnchantments.text.copyWith(fontSize: 16.0),
          children: <TextSpan>[
            TextSpan(
                text: '${_random.toString()}%',
                style: FontEnchantments.text.copyWith(fontSize: 16.0, color: Colors.redAccent)),
            const TextSpan(text: ' Nitrogen: '),
            TextSpan(
                text: '${_random.toString()}%\n',
                style: FontEnchantments.text.copyWith(fontSize: 16.0, color: Colors.red)),
            const TextSpan(text: 'Water: '),
            TextSpan(
                text: '${(_random / 5).round().toString()}%',
                style: FontEnchantments.text.copyWith(fontSize: 16.0, color: Colors.deepOrange)),
            const TextSpan(text: ' NO LIFE POSSIBLE!')
          ],
        ),
      );
}
