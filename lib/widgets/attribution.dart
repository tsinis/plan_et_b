import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helpers/glitch_extension.dart';

const List<_Attribution> attributions = [
  _Attribution(
    type: 'Display Font',
    name: 'Corruptor Clean LDR',
    nameURL: 'https://fontstruct.com/fontstructions/show/985416',
    author: 'Michał Nowak (“Neoqueto”)',
    authorURL: 'https://fontstruct.com/fontstructors/196948/neoqueto',
    licenseURL: 'http://creativecommons.org/licenses/by-nc-sa/3.0/',
    license: 'CC BY-NC-SA 3.0',
  ),
  _Attribution(
    type: 'Display Font',
    name: 'Corruptor LDR',
    nameURL: 'https://fontstruct.com/fontstructions/show/983353',
    author: 'Michał Nowak (“Neoqueto”)',
    authorURL: 'https://fontstruct.com/fontstructors/196948/neoqueto',
    licenseURL: 'http://creativecommons.org/licenses/by-nc-sa/3.0/',
    license: 'CC BY-NC-SA 3.0',
  ),
  _Attribution(
    type: 'Text Font',
    name: 'Polentical Neon',
    nameURL: 'https://www.dafont.com/polentical-neon.font',
    author: 'Jayvee D. Enaguas (“Grand Chaos“)',
    authorURL: 'https://harvettfox96.neocities.org',
    licenseURL: 'https://creativecommons.org/licenses/by-sa/3.0/',
    license: 'CC BY-SA 3.0',
  ),
  _Attribution(
    type: 'Music',
    name: 'SCI FI HORROR OPENING MASTERED',
    nameURL: 'https://soundcloud.com/21bakerstreet/sci-fi-horror-opening-mastered',
    author: 'Michael Dunn (“21bakerstreet”)',
    authorURL: 'https://soundcloud.com/21bakerstreet',
    licenseURL: 'https://creativecommons.org/licenses/by/3.0/',
    license: 'CC BY 3.0',
    additional: 'Changes: WAV was converted to MP3 (64 kbps) and spaces in filename are replaced with undescores.',
  ),
];

class _Attribution extends StatelessWidget {
  const _Attribution(
      {@required this.name,
      @required this.author,
      @required this.license,
      @required this.nameURL,
      @required this.authorURL,
      @required this.licenseURL,
      @required this.type,
      this.additional,
      Key key})
      : super(key: key);

  final String name, author, license, nameURL, authorURL, licenseURL, type, additional;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            Text(
              '• Asset type: $type.  \n',
              maxLines: 2,
              textAlign: TextAlign.start,
              style: FontEnchantments.text.copyWith(fontSize: 16.0, color: Colors.blueGrey[300]),
            ),
            InkWell(
              mouseCursor: MaterialStateMouseCursor.clickable,
              onTap: () => launch(nameURL),
              child: RichText(
                maxLines: 1,
                text: TextSpan(
                  style: FontEnchantments.text.copyWith(fontSize: 16.0),
                  children: <TextSpan>[
                    const TextSpan(text: '"'),
                    TextSpan(
                        text: name,
                        style: FontEnchantments.text.copyWith(
                            decoration: TextDecoration.underline, color: Colors.lightBlueAccent, fontSize: 16.0)),
                    const TextSpan(text: '" '),
                  ],
                ),
              ),
            ),
            InkWell(
              mouseCursor: MaterialStateMouseCursor.clickable,
              onTap: () => launch(authorURL),
              child: RichText(
                maxLines: 1,
                text: TextSpan(
                  style: FontEnchantments.text.copyWith(fontSize: 16.0),
                  children: <TextSpan>[
                    const TextSpan(text: 'by '),
                    TextSpan(
                        text: author,
                        style: FontEnchantments.text.copyWith(
                            decoration: TextDecoration.underline, color: Colors.lightBlueAccent, fontSize: 16.0)),
                    const TextSpan(text: ' '),
                  ],
                ),
              ),
            ),
            InkWell(
              mouseCursor: MaterialStateMouseCursor.clickable,
              onTap: () => launch(licenseURL),
              child: RichText(
                maxLines: 1,
                text: TextSpan(
                  style: FontEnchantments.text.copyWith(fontSize: 16.0),
                  children: <TextSpan>[
                    const TextSpan(text: 'is licensed under '),
                    TextSpan(
                        text: license,
                        style: FontEnchantments.text.copyWith(
                            decoration: TextDecoration.underline, color: Colors.lightBlueAccent, fontSize: 16.0)),
                    // const TextSpan(text: '\n'),
                  ],
                ),
              ),
            ),
            (additional != null)
                ? Text('$additional',
                    maxLines: 5, style: FontEnchantments.text.copyWith(fontSize: 16.0, color: Colors.blueGrey[600]))
                : const SizedBox.shrink(),
          ],
        ),
      );
}
