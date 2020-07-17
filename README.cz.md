﻿:globe_with_meridians:  [english](README.md)  |   **<u>český</u>**	|   [русский](README.ru.md)

# Plan-et-а B (PWA Hra) 🪐

## Obsah:
* [Popis](#Popis)
* [Jak na to](#Jak-na-to)
  * [Jak hrát online?](#Jak-hrát-online?)
  * [Jak hrát lokálně?](#Jak-hrát-lokálně?)
  * [Jak to sestavit?](#Jak-to-sestavit?)
* [Úkoly](#Úkoly-do-budoucna)
* [Licence](#Licence)
* [Atribuce](#Atribuce)
* [Vydání](#Vydání)
* [Technická data](#Technická-data)

![Screenshot](preview.gif)

## Popis

V této větvi najdete **aktualizovanou verzi**  mého **vítězného příspěveku** v **oficiálním, dvoudenním, mezinárodním hackathonu Společenství Flutter** s názvem „***#Hack20***“.
> **Pozor:** V sousední větvi naleznete originální verzi, která byla poslána do hackathonu.

Hackaton měl **přes 2665 účastníků, 650 týmů**, s 266 projekty. Psaní kódu se řídilo pravidly hackathonu, seznam dalších výherců a další informace o pravidlech najdete na oficiálních stránkách: [flutterhackathon.com](https://flutterhackathon.com)

#### Oficiální témata Hackathonu Flutter Společenství v roce 2020:

* 🌎 **Zachraňte planetu** (Ekologie / Co jsme se naučili během pandemie)

* 👾 **Retro / Kyberpunk budoucnost**

Rozhodl jsem se pracovat na obou tématech a vytvořil jednoduchou **pseudo-3D hru, ve stylu Wing Commander (1990). S kyberpunk / Iron Man uživatelským rozhraním a tematickou hudbou a zvuky. Můžete si jej zahrát v internetovém prohlížeči nebo nainstalovat do zařízení pro offline použití, protože je to progresivní webové aplikace (PWA)**. Hlavní jádro této hry bylo vyrobeno v [Rive](https://rive.app) (bývalé Flare).
> **Poznámka:** Design hry je sám o sobě nezávislý na velikosti displeje, tj. aplikaci lze spustit na jakkoli velkém displeji bez ztráty kvality (všechna grafika je připravena ve křivkách), avšak vytvářel jsem ho pro displeje, o velikosti cca 7-12'.

Vaším úkolem je **létat ve vesmíru, hledat tzv. „Planetu B“ a určovat vhodnost této planety pro život (kliknutím). K dispozici je tucet planet, které máte zkontrolovat, ale máte málo paliva** (na cca 1,5 minuty letu). Na konci mise uvidíte počet naskenovaných planet nebo si hru můžete znovu spustit.

> **Poznámka:** Hra byla vytvořena v průběhu dvou dnů jednou osobou. Nejsou v ní žádné komplikované herní mechaniky, je to jen koncept, vize s příjemným doprovodem, která může někoho inspirovat.

Zde si můžete prohlédnout **video (s zvýrazněním hlavní funkčnosti), v anglickém jazyce:**

**[Gameplay na YouTube](https://youtu.be/_hoEp9jGoLc)**

<details>
  <summary>Spoiler o hře</summary>

Tady neexistuje žádná planeta B (vhodná pro život). A je to hlavní bod této hry a filozofická část vztahující se k tématu ekologie... **Musíme se starat o naši Zemi.**

</details>

## Jak na to

### Jak hrát online?

---

:warning: **Důležité! Dříve než začnete!**


Tento projekt v podobě progresivní webové aplikace (PWA) **lze spustit pouze v novějších Chromium prohlížečích (Chrome, Edge, atd) verze 83 nebo novější. Také jsem to testoval na Firefox v77+**, takže to může být také v pořádku. Nesnažte se jej spustit na Safari, Internet Exploreru atd. - nemohou to zvládnout!

---
:information_source: Bude spuštěna nová verze, pro zobrazení původní hry stačí sestavit projekt ze sousední větvi lokálně.

Díky [Codemagic](https://codemagic.io), stačí kliknout na tento odkaz a spustit jej v moderním prohlížeči:

[https://hack20.codemagic.app](https://hack20.codemagic.app)

### Jak hrát lokálně?
Předpokládá se, že již máte nainstalovaný Flutter. Postupujte prosím podle následujících pokynů ve svém terminálu:
````markdown
flutter channel master
flutter upgrade
flutter config --enable-macos-desktop
git clone https://github.com/tsinis/plan_et_b.git
cd plan_et_b
flutter run -d chrome --release --dart-define=FLUTTER_WEB_USE_SKIA=true --dart-define=FLUTTER_WEB_USE_EXPERIMENTAL_CANVAS_TEXT=true
````

:exclamation: Poslední řádek je nejdůležitější! **Použijte prosím tyto příznaky**, jinak se animace Rive nebudou zobrazovat správně.

### Jak to sestavit?

Předpokládá se, že již máte nainstalovaný Flutter verze 1.19 nebo vyšší. Spusťte tyto příkazy ze složky projektu ve vašem terminálu:

* Pro web:
```
flutter config --enable-web
flutter build web --release --dart-define=FLUTTER_WEB_USE_SKIA=true --dart-define=FLUTTER_WEB_USE_EXPERIMENTAL_CANVAS_TEXT=true
```

* Pro macOS:
```
flutter config --enable-macos-desktop
flutter build macos --release
```

* Pro Android:
```
flutter build apk --split-per-abi
```
* Pro iOS:
```
flutter build ios --release --no-codesign
```

*Bohužel na PC (Windows a Linux) nebude žádný zvuk ani hudba, protože jsem nenašel žádný vhodný plugin pro tyto platformy. Můžete hru sestavit pro tyto platformy bez jakýchkoli chyb při kompilaci jenom po odebrání balíčku audio přehrávače z kódu.*

Každopádně, tato hra byla vytvořena jako progresivní webové aplikace (PWA), není tedy důvod mít nativní aplikaci, protože hru můžete nainstalovat z prohlížeče na téměř jakémkoli zařízení.

## Úkoly do budoucna

- [x] Vytvořit jádro hry.
- [x] Vytvořit pseudo-3D rozhraní.
- [x] Přidat zvuky a hudbu.
- [x] Opravit zvuk na platformách jiných než Web a Android.
- [x] Přidat Příběh a stylizovat nabídky do stylu kyberpunk.
- [ ] Přidat úvodní obrazovku a ikonky.

## Licence
Kód je licencován na základě [MIT licence](./LICENSE), podklady (jako zvuky, animace a písma) jsou licencovány s CC licenci. Soubor s názvem **LICENSE** najdete uvnitř adresářů, který obsahuje kopii licence, s plným textem této licence, v anglickém jazyce.

## Atribuce

* Typ asetu: Nadpisové písmo.
[“Corruptor Clean LDR”](https://fontstruct.com/fontstructions/show/985416)
od [Michał Nowak “Neoqueto”](https://fontstruct.com/fontstructors/196948/neoqueto)
je licencován na základě licence [CC BY-NC-SA 3.0](https://creativecommons.org/licenses/by-nc-sa/3.0/).
* Typ asetu: Nadpisové písmo.
[“Corruptor LDR”](https://fontstruct.com/fontstructions/show/983353)
od [Michał Nowak “Neoqueto”](https://fontstruct.com/fontstructors/196948/neoqueto)
je licencován na základě licence [CC BY-NC-SA 3.0](http://creativecommons.org/licenses/by-nc-sa/3.0/).
* Typ asetu: Textové písmo.
[“Polentical Neon”](https://www.dafont.com/polentical-neon.font)
od [Jayvee D. Enaguas “Grand Chaos“](https://harvettfox96.neocities.org)
je licencován na základě licence [CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0/).
* Typ asetu: Hudba,
[“SCI FI HORROR OPENING MASTERED”](https://soundcloud.com/21bakerstreet/sci-fi-horror-opening-mastered)
od [Michael Dunn “21bakerstreet”](https://soundcloud.com/21bakerstreet)
je licencován na základě licence [CC BY 3.0](https://creativecommons.org/licenses/by/3.0/).
>**Změny v hudebním assetu:** WAV byl převeden na MP3 (64 kbps) a mezery v názvu souboru jsou nahrazeny podtržítky.

## Vydání

Binární spouštěcí soubory pro Android, macOS a Web najdete v části [Releases](https://github.com/tsinis/plan_et_b/releases) tohoto repozitáře GitHub.

## Technická data

| Název | Popis |
| ---- | ----------- |
| **Název frameworku** | [Flutter](https://flutter.dev) |
| Verze frameworku | [1.20.0-3.0.pre.78](https://github.com/flutter/flutter) |
| Kanál frameworku | master |
| **Název jazyka** | [Dart](https://dart.dev) |
| Verze jazyka | [2.9.0](https://github.com/dart-lang) |
| Kanál jazyka | beta |
| **Název vývojového prostředí** | [Visual Studio Code](https://code.visualstudio.com/insiders/) |
| Verze vývojového prostředí | [1.47.0](https://github.com/microsoft/vscode) |
| Kanál vývojového prostředí | předběžný |
| Název závislosti třetí strany | Auto Size Text|
| Balíček závislosti třetí strany | [auto_size_text](https://pub.dev/packages/auto_size_text) |
| Verze závislosti třetí strany | [any](https://github.com/leisim/auto_size_text) |
| Kanál závislosti třetí strany | stabilní |
| Název závislosti třetí strany | Assets Audio Player |
| Balíček závislosti třetí strany | [assets_audio_player](https://pub.dev/packages/assets_audio_player) |
| Verze závislosti třetí strany | [any](https://github.com/florent37/Flutter-AudioPlayer) |
| Kanál závislosti třetí strany | stabilní |
| Název závislosti třetí strany | [Rive](https://rive.app) (bývalé Flare) |
| Balíček závislosti třetí strany | [flare_flutter](https://pub.dev/packages/flare_flutter) |
| Verze závislosti třetí strany | [2.0.4](https://github.com/2d-inc/Flare-Flutter) |
| Kanál závislosti třetí strany | stabilní |
| Architektura | Vanilla |