import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helpers/glitch_extension.dart';

const List<_Attribution> attributions = [
  _Attribution(
    type: 'Display Font',
    name: 'Corruptor Clean LDR',
    nameURL: 'https://fontstruct.com/fontstructions/show/985416',
    author: 'Michal Nowak (“Neoqueto”)',
    authorURL: 'https://fontstruct.com/fontstructors/196948/neoqueto',
    licenseURL: 'http://creativecommons.org/licenses/by-nc-sa/3.0/',
    license: 'CC BY-NC-SA 3.0',
  ),
  _Attribution(
    type: 'Display Font',
    name: 'Corruptor LDR',
    nameURL: 'https://fontstruct.com/fontstructions/show/983353',
    author: 'Michal Nowak (“Neoqueto”)',
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
    additionalInfo: 'Changes: WAV was converted to MP3 (64 kbps) and spaces in filename are replaced with underscores.',
  ),
];

// Here we will create an Attribution template class, so we easily add new attributions without creating each one manually.
class _Attribution extends StatelessWidget {
  const _Attribution(
      {@required this.author,
      @required this.authorURL,
      @required this.name,
      @required this.nameURL,
      @required this.license,
      @required this.licenseURL,
      @required this.type,
      this.additionalInfo,
      Key key})
      : super(key: key);

  final String author, authorURL, name, nameURL, license, licenseURL, type, additionalInfo;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            Text(
              '• Asset type: $type.  \n',
              maxLines: 2,
              textAlign: TextAlign.start,
              style: FontEnchantments.text.copyWith(fontSize: 16, color: Colors.blueGrey[300]),
            ),
            InkWell(
              mouseCursor: MaterialStateMouseCursor.clickable,
              onTap: () => launch(nameURL),
              child: RichText(
                maxLines: 1,
                text: TextSpan(
                  style: FontEnchantments.text.copyWith(fontSize: 16),
                  children: <TextSpan>[
                    const TextSpan(text: '"'),
                    TextSpan(
                        text: name,
                        style: FontEnchantments.text.copyWith(
                            decoration: TextDecoration.underline, color: Colors.lightBlueAccent, fontSize: 16)),
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
                  style: FontEnchantments.text.copyWith(fontSize: 16),
                  children: <TextSpan>[
                    const TextSpan(text: 'by '),
                    TextSpan(
                        text: author,
                        style: FontEnchantments.text.copyWith(
                            decoration: TextDecoration.underline, color: Colors.lightBlueAccent, fontSize: 16)),
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
                  style: FontEnchantments.text.copyWith(fontSize: 16),
                  children: <TextSpan>[
                    const TextSpan(text: 'is licensed under '),
                    TextSpan(
                        text: license,
                        style: FontEnchantments.text.copyWith(
                            decoration: TextDecoration.underline, color: Colors.lightBlueAccent, fontSize: 16)),
                  ],
                ),
              ),
            ),
            if (additionalInfo != null)
              Text(additionalInfo,
                  maxLines: 5, style: FontEnchantments.text.copyWith(fontSize: 16, color: Colors.blueGrey[600]))
          ],
        ),
      );
}
