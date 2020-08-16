import 'dart:math' show Random;

import 'package:flutter/material.dart';

import '../helpers/glitch_extension.dart';

// Random warning is generated 1 second after the detection start.
class DetectorInfo extends StatelessWidget {
  const DetectorInfo({Key key}) : super(key: key);
  static final Random _random = Random(); // Initialize random generator.
  int get _randomNumber => _random.nextInt(20); // Generate random number (from 0 to 20), for later use in reports.
  @override
  Widget build(BuildContext context) => Wrap(
          // Wrap is adaptive to screen size/orientation, so we can place our icon on top or on the left side.
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          spacing: 10,
          children: [
            const Icon(Icons.warning, color: Color(0x4D09cad9), size: 40), // Warning icon with transparent cyan color.
            // Generating reports about life suability of planets, with random numbers.
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Oxygen: ',
                style: FontEnchantments.text.copyWith(fontSize: 16),
                children: <TextSpan>[
                  TextSpan(
                      text: '$_randomNumber%',
                      style: FontEnchantments.text.copyWith(fontSize: 16, color: Colors.redAccent)),
                  const TextSpan(text: ' Nitrogen: '),
                  TextSpan(
                      text: '$_randomNumber%\n',
                      style: FontEnchantments.text.copyWith(fontSize: 16, color: Colors.red)),
                  const TextSpan(text: 'Water: '),
                  TextSpan(
                      text: '${(_randomNumber / 5).round()}%',
                      style: FontEnchantments.text.copyWith(fontSize: 16, color: Colors.deepOrange)),
                  TextSpan(
                      text: ' NO LIFE POSSIBLE!',
                      style: FontEnchantments.text.copyWith(fontSize: 16, color: const Color(0xFFFF8A80))),
                ],
              ),
            )
          ]);
}
