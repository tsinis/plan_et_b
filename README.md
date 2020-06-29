# Plan-et-B

This project is **my submission** in **Flutter Community** hackathon, called "***Hack20***". You can read more about this contest here: [flutterhackathon.com](https://flutterhackathon.com/)

![Screenshot](preview.gif)


## What it is like?
I've made a simple **Wing Commander (1990) like, PWA Game, with cyberpunk, Iron Man like UI and nice music/SFX**. There is a lot of details and animations inside, made with [Rive](https://rive.app) (ex Flare) tool.
> **Note:** design is screen size independent, because all the graphics is made in vectors (not bitmaps), but I have prepared it with 7-12' screen size in mind.

Your mission is to, **fly around the space and determine a planet's suitability for life (by clicking). There is a dozen planets to check, but you are low on fuel (for about 1,5 minutes)**. You can watch a **preview video of it (with main functionality highlight) here:**

***[Gameplay on YouTube](https://youtu.be/_hoEp9jGoLc)***

https://youtu.be/_hoEp9jGoLc

# Important! BEFORE YOU START:
This project in form of PWA **will only run on most recent browsers, with Chromium engine v85+ or newer. Also i have tested it on Firefox v77+**, so it might be OK too. Don't even try to run it on Safari, IE etc, they can't handle it.

> **Spoiler:** There is no planet B (suitable for life). And it's the main point of this game... We need to take care of our Earth.

### Let's run it online!
Thanks to [Codemagic](https://codemagic.io), you can just follow this link and run it in your super modern browser:

***[https://hack20.codemagic.app](https://hack20.codemagic.app)***

## Showcase in Flutter
This project is made in most recent Flutter and Dart version — to be exact:
````markdown
 Flutter (Channel master, 1.20.0-3.0.pre.78, on Microsoft Windows [Version 10.0.19041.329]
    • Flutter version 1.20.0-3.0.pre.78 at C:\Android\flutter
    • Framework revision 2962912d68 (2 days ago), 2020-06-27 00:59:50 -0700
    • Engine revision fc0e27210c
    • Dart version 2.9.0 (build 2.9.0-19.0.dev 63cf56d925)
````
**So please do not report problems if your setup is older then this one.**

### Let's run it locally!
Please follow this commands in your terminal:
````markdown
flutter channel master
flutter upgrade
git clone https://github.com/tsinis/plan_et_b.git
cd plan_et_b
flutter run -d chrome --release --dart-define=FLUTTER_WEB_USE_SKIA=true --dart-define=FLUTTER_WEB_USE_EXPERIMENTAL_CANVAS_TEXT=true
````

**Last line is most important! Please DO use this flags** --release --dart-define=FLUTTER_WEB_USE_SKIA=true --dart-define=FLUTTER_WEB_USE_EXPERIMENTAL_CANVAS_TEXT=true
otherwise Rive animations will not work.

### Let's run it on devices!

I will add an Android releases to Release Section of this repository. Sadly other devices (like iPhones, PCs, Macs will have no sound and music in it, because I have not found any good plugin for it). But anyways this game was made to be a PWA, so there is no reason to have native app, since you can install it from browser.

## License and Copyright
This project is released under the terms of the [MIT license](./LICENSE). All assets (as sounds, animations and font) are OFL and CC licensed and are free for personal use. You can find license files in their folders.