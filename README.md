﻿﻿:globe_with_meridians:  **<u>english</u>**  |   [český](README.cz.md) |   [русский](README.ru.md)

# Plan-et-B (PWA Game) 🚀

## Table of content

* [Description](#Description)
* [How To Section](#How-to-Section)
  * [How to play it online](#How-to-play-it-online)
  * [How to play it locally](#How-to-play-it-locally)
  * [How to build it](#How-to-build-it)
* [To-Do Section](#To-Do-Section)
* [Licenses](#Licenses)
* [Attributions](#Attributions)
* [Releases](#Releases)
* [Technical Data](#Technical-Data)

![Screenshot](preview.gif)

## Description

In this branch you will find the **updated** version of my **award-winning submission** in the **Official international Flutter Community Hackaton** called "***#Hack20***".
> **Note:**  In another branch you will find the original version that was submitted in hackathon.

The hackaton had over **2665 attendees, 650 teams**, with 266 projects. Writing the code was guided by the hackathon rules, the list of other winners, as well as more info about the rules, can be found on the official website: [flutterhackathon.com](https://flutterhackathon.com)

> **Also:**  This project was featured at main-page of [It's All Widgets!](https://itsallwidgets.com) web-site on July 23, 2020.

### Official Flutter Community Hackathon 2020 Themes

* 🌎 **Saving the Planet** (Eco / What we’ve learned during the pandemic)

* 👾 **Retro / Cyberpunk Future**

I decided to work on both topics and made a simple **Wing Commander (1990) like pseudo-3D game, with Cyberpunk / Iron Man like HUD and some themed Music/SFX. You can play it in your internet browser and install to the device for offline use because it's PWA**. The main core of this game was made with [Rive](https://rive.app) (ex Flare) tool.
> **Note:** design is screen size-independent because all the graphics are made in vectors (not bitmaps), but I have prepared it with 7-12' screen size in mind.

Your mission is to, **fly around the space, looking for so-called "Planet B" and determine this planet's suitability for life (by clicking). There are a dozen planets to check, but you are low on fuel** (you have about 1,5 minutes). At the end of the mission, you can see the number of planets scanned or you can play the game again.

> **Note:** The game was created within two days by one person. There are no complicated game mechanics, it's just a concept, a vision with a nice entourage, that may inspire someone.

You can watch a **preview video of it (with main functionality highlight) here:**

[![Plan-et B](https://i.vimeocdn.com/video/927377809_1920x1080.jpg)](https://vimeo.com/tsinis/hack20)[Vimeo](https://vimeo.com/tsinis/hack20) or [YouTube](https://youtu.be/I6B1PfaIxM4)

<details>
  <summary>Spoiler about Gameplay</summary>

There is no planet B (suitable for life). And it's the main point of this game and philosophical part related to the topic of Ecology... **We need to take care of our Earth.**

</details>

## How To Section

### How to play it online

---

:warning: **Important! BEFORE YOU START!**

This project in form of PWA **will only run on most recent browsers, with Chromium (Chrome, Edge, etc.) engine v83 or newer. Also, I've tested it on Firefox v77+**, so it might be OK too. Don't even try to run it on Safari, Internet Explorer and so on — they can't handle it!

---
:information_source: Updated version will be launched, to view the original game just build a project from another branch locally.

Thanks to [Codemagic](https://codemagic.io), you can just follow this link and run it in your modern browser:

[https://hack20.codemagic.app](https://hack20.codemagic.app)

### How to play it locally

The Flutter and Chrome/Chromium Browser is expected to be installed. Please follow this commands in your terminal:

````bash
flutter channel master
flutter upgrade
flutter config --enable-web
git clone https://github.com/tsinis/plan_et_b.git
cd plan_et_b
flutter run -d chrome --release --dart-define=FLUTTER_WEB_USE_SKIA=true --dart-define=FLUTTER_WEB_USE_EXPERIMENTAL_CANVAS_TEXT=true
````

:exclamation: The last line is most important! **Please DO use this flags**, otherwise, Rive animations will not be displayed correctly.

### How to build it

Flutter version 1.19 or higher is assumed to be installed. Please run this command from the project's folder, in your terminal:

* For Web:

```bash
flutter config --enable-web
flutter build web --release --dart-define=FLUTTER_WEB_USE_SKIA=true --dart-define=FLUTTER_WEB_USE_EXPERIMENTAL_CANVAS_TEXT=true
```

* For macOS:

```bash
flutter config --enable-macos-desktop
flutter build macos --release
```

* For Android:

```bash
flutter build apk --split-per-abi
```

* For iOS:

```bash
flutter build ios --release --no-codesign
```

 *Sadly PCs (Windows and Linux) will have no sound and music, because I didn't found any good plugin for it. You can build it for those platforms without any compile errors just after removing the audio player package from the code.*

 Anyways this game was made to be a PWA, so there is no reason to have a native app, since you can install it from a browser, on almost any recent device.

## To-Do Section

* [x] Create Game Core.
* [x] Create Pseudo-3D HUD.
* [x] Add Sounds and Music.
* [x] Fix Audio on platforms other than Web and Android.
* [x] Add a Story and stylize the menus to Cyberpunk style.
* [x] Add Launcher Icons.

## Licenses

This project is released under the terms of the [MIT license](./LICENSE). All assets (as sounds, animations, and fonts) are CC licensed and are free for personal use. You can find **LICENSE** files in their folders.

## Attributions

* Asset type: Display Font.
[“Corruptor Clean LDR”](https://fontstruct.com/fontstructions/show/985416)
by [Michał Nowak “Neoqueto”](https://fontstruct.com/fontstructors/196948/neoqueto)
is licensed under [CC BY-NC-SA 3.0](https://creativecommons.org/licenses/by-nc-sa/3.0/).
* Asset type: Display Font.
[“Corruptor LDR”](https://fontstruct.com/fontstructions/show/983353)
by [Michał Nowak “Neoqueto”](https://fontstruct.com/fontstructors/196948/neoqueto)
is licensed under [CC BY-NC-SA 3.0](http://creativecommons.org/licenses/by-nc-sa/3.0/).
* Asset type: Text Font.
[“Polentical Neon”](https://www.dafont.com/polentical-neon.font)
by [Jayvee D. Enaguas “Grand Chaos“](https://harvettfox96.neocities.org)
is licensed under [CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0/).
* Asset type: Music,
[“SCI FI HORROR OPENING MASTERED”](https://soundcloud.com/21bakerstreet/sci-fi-horror-opening-mastered)
by [Michael Dunn “21bakerstreet”](https://soundcloud.com/21bakerstreet)
is licensed under [CC BY 3.0](https://creativecommons.org/licenses/by/3.0/).

> **Changes in Music Asset:** WAV was converted to MP3 (64 kbps) and spaces in filename are replaced with underscores.

## Releases

You can find binaries for Android, macOS and Web in [Releases](https://github.com/tsinis/plan_et_b/releases) section of this GitHub repository.

## Technical Data

Most of the code is covered with comments.

| Name | Description |
| ---- | ----------- |
| **Framework name** | [Flutter](https://flutter.dev) |
| Framework version | [1.21.0-2.0.pre.60](https://github.com/flutter/flutter) |
| Framework channel | master |
| **Language name** | [Dart](https://dart.dev) |
| Language version | [2.9.0](https://github.com/dart-lang) |
| Language channel | beta |
| **IDE name** | [Visual Studio Code](https://code.visualstudio.com/insiders/) |
| IDE version | [1.48.0](https://github.com/microsoft/vscode) |
| IDE channel | insider |
| 3rd-party Dependency name | Auto Size Text|
| 3rd-party Dependency package | [auto_size_text](https://pub.dev/packages/auto_size_text) |
| 3rd-party Dependency version | [2.1.0](https://github.com/leisim/auto_size_text) |
| 3rd-party Dependency name | Assets Audio Player |
| 3rd-party Dependency package | [assets_audio_player](https://pub.dev/packages/assets_audio_player) |
| 3rd-party Dependency version | [2.0.8+2](https://github.com/florent37/Flutter-AudioPlayer) |
| 3rd-party Dependency name | [Rive](https://rive.app) (ex Flare) |
| 3rd-party Dependency package | [flare_flutter](https://pub.dev/packages/flare_flutter) |
| 3rd-party Dependency version | [2.0.4](https://github.com/2d-inc/Flare-Flutter) |
| 3rd-party Dependency name | URL Launcher |
| 3rd-party Dependency package | [url_launcher](https://pub.dev/packages/url_launcher) |
| 3rd-party Dependency version | [5.5.0](https://github.com/flutter/plugins) |
| 3rd-party Dependency name | Stateless Animation |
| 3rd-party Dependency package | [sa_stateless_animation](https://pub.dev/packages/sa_stateless_animation) |
| 3rd-party Dependency version | [1.0.1](https://github.com/felixblaschke/sa_stateless_animation) |
| 3rd-party Dependency name | Flutter Phoenix |
| 3rd-party Dependency package | [flutter_phoenix](https://pub.dev/packages/flutter_phoenix) |
| 3rd-party Dependency version | [0.1.0](https://github.com/mobiten/flutter_phoenix) |
| Architecture | Listener (without Global States) |
