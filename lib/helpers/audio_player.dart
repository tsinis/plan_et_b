import 'package:assets_audio_player/assets_audio_player.dart';

class AudioPlayer {
  static final AssetsAudioPlayer _musicAudioPlayer = AssetsAudioPlayer.withId('music_player');
  static final AssetsAudioPlayer _sfxAudioPlayer = AssetsAudioPlayer.withId('sfx_player');
  static final AssetsAudioPlayer _voiceAudioPlayer = AssetsAudioPlayer.withId('voice_player');

  static Future<void> get cacheAudio async {
    await _musicAudioPlayer.open(Audio('assets/audio/music/SCI_FI_HORROR_OPENING_MASTERED.mp3'),
        loopMode: LoopMode.single, autoStart: false, volume: 0.05, respectSilentMode: true, showNotification: false);
    await _sfxAudioPlayer.open(Audio('assets/audio/sfx/431732__sieuamthanh__beam-11.wav'),
        autoStart: false,
        volume: 0.15,
        loopMode: LoopMode.none,
        playInBackground: PlayInBackground.disabledRestoreOnForeground,
        respectSilentMode: true,
        showNotification: false);
    await _voiceAudioPlayer.open(Audio('assets/audio/voice/voice.mp3'),
        autoStart: false,
        loopMode: LoopMode.none,
        playInBackground: PlayInBackground.disabledRestoreOnForeground,
        respectSilentMode: true,
        showNotification: false);
  }

  static Future<void> get playPauseMusic async => await _musicAudioPlayer.playOrPause();

  static Future<void> get playSound async => await _sfxAudioPlayer.play();

  static Future<void> get playVoice async => await Future.delayed(const Duration(seconds: 5), _voiceAudioPlayer.play);
}

// static void get playSound =>
//     AssetsAudioPlayer.playAndForget(Audio('assets/audio/sfx/431732__sieuamthanh__beam-11.wav'),
//         volume: 0.25, respectSilentMode: true);
