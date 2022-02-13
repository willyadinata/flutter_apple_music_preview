import 'package:applemusic/common/core/enums/enums.dart';
import 'package:applemusic/di/get_it.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../blocs/music_player/music_player_cubit.dart';

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AudioPlayer _audioPlayer = getItInstance<AudioPlayer>();

    return Container(
      height: 100,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 0.20),
            blurRadius: 10,
            spreadRadius: 2,
          )
        ],
      ),
      child: Column(
        children: [
          const Spacer(),
          BlocBuilder<MusicPlayerCubit, MusicPlayerState>(
            buildWhen: (previous, current) {
              return previous.position != current.position ||
                  previous.bufferedPosition != current.bufferedPosition ||
                  previous.totalDuration != current.totalDuration;
            },
            builder: (context, state) {
              return ProgressBar(
                baseBarColor: state.playerState == AudioPlayerState.loaded
                    ? Colors.blue
                    : Colors.black45,
                thumbColor: state.playerState == AudioPlayerState.loaded
                    ? Colors.blue
                    : Colors.black45,
                progress: state.position,
                buffered: state.bufferedPosition,
                total: state.totalDuration,
              );
            },
          ),
          BlocBuilder<MusicPlayerCubit, MusicPlayerState>(
            buildWhen: (previous, current) {
              return previous.playerState != current.playerState;
            },
            builder: (context, state) {
              if (_audioPlayer.processingState == ProcessingState.loading) {
                return const SizedBox(
                  width: 20.0,
                  height: 20.0,
                  child: CircularProgressIndicator(
                    color: Colors.black45,
                  ),
                );
              }
              if (_audioPlayer.processingState == ProcessingState.ready) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: !_audioPlayer.playing
                      ? IconButton(
                          key: const ValueKey('playButton'),
                          onPressed: () {
                            _audioPlayer.play();
                          },
                          icon: const Icon(
                            Icons.play_arrow,
                            size: 30.0,
                          ),
                        )
                      : IconButton(
                          key: const ValueKey('pauseButton'),
                          onPressed: () {
                            _audioPlayer.pause();
                          },
                          icon: const Icon(
                            Icons.pause,
                            size: 30.0,
                          ),
                        ),
                );
              }

              return const Icon(Icons.play_disabled_outlined);
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
