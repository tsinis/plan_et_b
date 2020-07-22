import 'dart:math' show Random;

import 'package:flutter/material.dart';

import '../helpers/glitch_extension.dart';

class DetectorInfo extends StatelessWidget {
  const DetectorInfo({Key key}) : super(key: key);
  static final Random _random = Random();
  int get _randomNumber => _random.nextInt(20);
  @override
  Widget build(BuildContext context) => Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        spacing: 10.0,
        children: [
          const Icon(Icons.warning, color: Color(0x4d084e79), size: 40),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Oxygen: ',
              style: FontEnchantments.text.copyWith(fontSize: 16.0),
              children: <TextSpan>[
                TextSpan(
                    text: '$_randomNumber%',
                    style: FontEnchantments.text.copyWith(fontSize: 16.0, color: Colors.redAccent)),
                const TextSpan(text: ' Nitrogen: '),
                TextSpan(
                    text: '$_randomNumber%\n',
                    style: FontEnchantments.text.copyWith(fontSize: 16.0, color: Colors.red)),
                const TextSpan(text: 'Water: '),
                TextSpan(
                    text: '${(_randomNumber / 5).round()}%',
                    style: FontEnchantments.text.copyWith(fontSize: 16.0, color: Colors.deepOrange)),
                TextSpan(
                    text: ' NO LIFE POSSIBLE!',
                    style: FontEnchantments.text.copyWith(fontSize: 16.0, color: Colors.redAccent[100])),
              ],
            ),
          )
        ],
      );
}
