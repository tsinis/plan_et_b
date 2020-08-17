import 'package:assets_audio_player/assets_audio_player.dart';

// self-explanatory part of audio player. Doesn't need to be in class, since it's all statics.
// ignore: avoid_classes_with_only_static_members
class AudioPlayer {
  static final AssetsAudioPlayer _musicPlayer = AssetsAudioPlayer.withId('music_player');
  static final AssetsAudioPlayer _sfxPlayer = AssetsAudioPlayer.withId('sfx_player');
  static final AssetsAudioPlayer _voicePlayer = AssetsAudioPlayer.withId('voice_player');

  static Future<void> get preCache async {
    await _musicPlayer.open(Audio('assets/audio/music/SCI_FI_HORROR_OPENING_MASTERED.mp3'),
        loopMode: LoopMode.single, autoStart: false, volume: 0.1, respectSilentMode: true, showNotification: false);
    await _sfxPlayer.open(Audio('assets/audio/sfx/431732__sieuamthanh__beam-11.wav'),
        autoStart: false,
        volume: 0.15,
        loopMode: LoopMode.none,
        playInBackground: PlayInBackground.disabledRestoreOnForeground,
        respectSilentMode: true,
        showNotification: false);
    await _voicePlayer.open(Audio('assets/audio/voice/voice.mp3'),
        autoStart: false,
        loopMode: LoopMode.none,
        playInBackground: PlayInBackground.disabledRestoreOnForeground,
        respectSilentMode: true,
        showNotification: false);
  }

  static Future<void> get playOrPauseMusic async => await _musicPlayer.playOrPause();

  static Future<void> get playSound async => await _sfxPlayer.play();

  static Future<void> get restartVoice async => await _voicePlayer.stop().whenComplete(() => playVoice);

  static Future<void> get playVoice async => await Future.delayed(const Duration(seconds: 5), _voicePlayer.play);
}
