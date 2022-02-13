part of 'music_list_cubit.dart';

class MusicListState extends Equatable {
  final List<MusicEntity> music;
  final BlocState stateStatus;
  final String errorMessage;
  final int currentIndex;

  const MusicListState({
    this.music = const [],
    this.stateStatus = BlocState.isInitial,
    this.errorMessage = '',
    this.currentIndex = -1,
  });

  @override
  List<Object> get props => [
        music,
        stateStatus,
        errorMessage,
        currentIndex,
      ];

  MusicListState copyWith({
    List<MusicEntity>? music,
    BlocState? stateStatus,
    String? errorMessage,
    int? currentIndex,
  }) {
    return MusicListState(
      music: music ?? this.music,
      stateStatus: stateStatus ?? this.stateStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
