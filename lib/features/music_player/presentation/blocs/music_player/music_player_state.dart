part of 'music_player_cubit.dart';

class MusicPlayerState extends Equatable {
  final BlocState stateStatus;
  final AudioPlayerState playerState;
  final Duration position;
  final Duration bufferedPosition;
  final Duration totalDuration;
  final String errorMessage;

  const MusicPlayerState({
    this.stateStatus = BlocState.isInitial,
    this.playerState = AudioPlayerState.initial,
    this.position = const Duration(minutes: 0),
    this.bufferedPosition = const Duration(minutes: 0),
    this.totalDuration = const Duration(minutes: 0),
    this.errorMessage = '',
  });

  @override
  List<Object?> get props => [
        stateStatus,
        playerState,
        position,
        bufferedPosition,
        totalDuration,
        errorMessage,
      ];

  MusicPlayerState copyWith({
    BlocState? stateStatus,
    AudioPlayerState? playerState,
    Duration? position,
    Duration? bufferedPosition,
    Duration? totalDuration,
    String? errorMessage,
  }) {
    return MusicPlayerState(
      stateStatus: stateStatus ?? this.stateStatus,
      playerState: playerState ?? this.playerState,
      position: position ?? this.position,
      bufferedPosition: bufferedPosition ?? this.bufferedPosition,
      totalDuration: totalDuration ?? this.totalDuration,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
