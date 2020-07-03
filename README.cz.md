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
* [Vydání](#Vydání)
* [Technická data](#Technická-data)

![Screenshot](preview.gif)

## Popis

V této větvi najdete **můj původní odměněný příspěvek** v **oficiálním hackathonu Flutter Community** nazvaném „***#Hack20***“. S více než 2665 účastníky, 650 týmy а s 266 přihlášenými projekty. Více o tomto hackathonu a jeho pravidlech si můžete přečíst zde: [flutterhackathon.com](https://flutterhackathon.com)

#### Oficiální témata Flutter Community Hackathonu 2020:

* 🌎 **Zachránit planetu** (Ekologie / Co jsme se naučili během pandemie)

* 👾 **Retro / Kyberpunk budoucnost**

Rozhodl jsem se pracovat na obou tématech a vytvořil jednoduchou **pseudo-3D hru, ve stylu Wing Commander (1990). S kyberpunk / Iron Man uživatelským rozhraním a tematickou hudbou a zvuky. Můžete si jej zahrát v internetovém prohlížeči nebo nainstalovat do zařízení pro offline použití, protože je to progresivní webové aplikace (PWA)**. Hlavní jádro této hry bylo vyrobeno v [Rive](https://rive.app) (bývalé Flare).
> **Poznámka:** design hry je sám o sobě nezávislý na velikosti displeje, tj. aplikaci lze spustit na jakkoli velkém displeji bez ztráty kvality (všechna grafika je připravena ve křivkách), avšak vytvářel jsem ho pro displeje, o velikosti cca 7-12'.

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

:warning: **Důležité! Dříve než začnete!** :warning:


Tento projekt v podobě progresivní webové aplikace (PWA) **lze spustit pouze v novějších Chromium prohlížečích (Chrome, Edge, atd) verze 83 nebo novější. Také jsem to testoval na Firefox v77+**, takže to může být také v pořádku. Nesnažte se jej spustit na Safari, Internet Exploreru atd. - nemohou to zvládnout!

---
Díky [Codemagic](https://codemagic.io), stačí kliknout na tento odkaz a spustit jej v moderním prohlížeči:

[https://hack20.codemagic.app](https://hack20.codemagic.app)

### Jak hrát lokálně?
Postupujte prosím podle následujících pokynů ve svém terminálu:
````markdown
flutter channel master
flutter upgrade
git clone https://github.com/tsinis/plan_et_b.git
cd plan_et_b
flutter run -d chrome --release --dart-define=FLUTTER_WEB_USE_SKIA=true --dart-define=FLUTTER_WEB_USE_EXPERIMENTAL_CANVAS_TEXT=true
````

:exclamation: Poslední řádek je nejdůležitější! **Použijte prosím tyto příznaky**, jinak se animace Rive nebudou zobrazovat správně.

### Jak to sestavit?

Spusťte tyto příkazy ze složky projektu ve vašem terminálu:

* Pro web:
```
flutter build web --release --dart-define=FLUTTER_WEB_USE_SKIA=true --dart-define=FLUTTER_WEB_USE_EXPERIMENTAL_CANVAS_TEXT=true
```

* Pro Android:
```
flutter build apk --split-per-abi
```

*Bohužel jiná zařízení (jako iPhone, PC, Mac nebudou mít žádný zvuk ani hudbu, protože jsem nenašel žádný vhodný plugin). Můžete hru sestavit pro tyto platformy bez jakýchkoli chyb při kompilaci jenom po odebrání balíčku audio přehrávače z kódu. Na tomto problému pracuji (viz Úkoly níže).*

Každopádně, tato hra byla vytvořena jako progresivní webové aplikace (PWA), není tedy důvod mít nativní aplikaci, protože hru můžete nainstalovat z prohlížeče na téměř jakémkoli zařízení.

## Úkoly do budoucna

- [x] Vytvořit jádro hry.
- [x] Vytvořit pseudo-3D rozhraní.
- [x] Přidat zvuky a hudbu.
- [ ] Opravit zvuk na platformách jiných než Web a Android.
- [ ] Přidat Příběh a stylizovat nabídky do stylu kyberpunk.
- [ ] Přidat úvodní obrazovku a ikonky.

## Licence
Kód je licencován na základě [MIT licence](./LICENSE), podklady (jako zvuky, animace a písmo) jsou licencovány s CC a OFL licenci. Soubor s názvem **LICENSE** najdete uvnitř adresářů, který obsahuje kopii licence, s plným textem této licence, v anglickém jazyce.

## Vydání

Binární spouštěcí soubory najdete v části [Releases](https://github.com/tsinis/plan_et_b/releases) tohoto repozitáře GitHub. Po opravě zvukového přehrávače, postupně přidám další binární soubory pro ostatní platformy.

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
| Verze závislosti třetí strany | [2.1.0](https://github.com/leisim/auto_size_text) |
| Kanál závislosti třetí strany | stabilní |
| Název závislosti třetí strany | Assets Audio Player |
| Balíček závislosti třetí strany | [assets_audio_player](https://pub.dev/packages/assets_audio_player) |
| Verze závislosti třetí strany | [2.0.6+4](https://github.com/florent37/Flutter-AssetsAudioPlayer) |
| Kanál závislosti třetí strany | stabilní |
| Název závislosti třetí strany | [Rive](https://rive.app) (bývalé Flare) |
| Balíček závislosti třetí strany | [flare_flutter](https://pub.dev/packages/flare_flutter) |
| Verze závislosti třetí strany | [2.0.3](https://github.com/2d-inc/Flare-Flutter) |
| Kanál závislosti třetí strany | stabilní |
| Architektura | Vanilla |