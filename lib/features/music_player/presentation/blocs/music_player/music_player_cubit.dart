import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../../common/core/enums/enums.dart';

part 'music_player_state.dart';

class MusicPlayerCubit extends Cubit<MusicPlayerState> {
  final AudioPlayer audioPlayer;

  MusicPlayerCubit({
    required this.audioPlayer,
  }) : super(const MusicPlayerState());

  void loadMusic(String url) async {
    try {
      emit(state.copyWith(playerState: AudioPlayerState.loading));
      await audioPlayer.setAudioSource(
        AudioSource.uri(
          Uri.parse(url),
        ),
        initialPosition: Duration.zero,
        preload: true,
      );
      emit(state.copyWith(playerState: AudioPlayerState.loaded));
      await _setAudioPlayer();
      await audioPlayer.play();
    } on PlayerException catch (error) {
      emit(
        state.copyWith(
          errorMessage: error.message,
          playerState: AudioPlayerState.failure,
        ),
      );
    }
  }

  _setAudioPlayer() async {
    audioPlayer.playerStateStream.listen((playerState) {
      final isPlaying = playerState.playing;
      final processingState = playerState.processingState;
      if (processingState == ProcessingState.loading ||
          processingState == ProcessingState.buffering) {
        emit(state.copyWith(playerState: AudioPlayerState.loading));
      } else if (!isPlaying) {
        emit(state.copyWith(playerState: AudioPlayerState.paused));
      } else if (processingState != ProcessingState.completed) {
        emit(state.copyWith(playerState: AudioPlayerState.playing));
      } else {
        audioPlayer.seek(Duration.zero);
        audioPlayer.pause();
      }
    });

    audioPlayer.positionStream.listen((position) {
      emit(state.copyWith(position: position));
    });

    audioPlayer.bufferedPositionStream.listen((bufferedPosition) {
      emit(state.copyWith(bufferedPosition: bufferedPosition));
    });

    audioPlayer.durationStream.listen((totalDuration) {
      emit(state.copyWith(totalDuration: totalDuration));
    });
  }
}
