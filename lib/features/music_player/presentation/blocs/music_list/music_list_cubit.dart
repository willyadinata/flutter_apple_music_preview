import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../common/core/enums/enums.dart';
import '../../../../music_player/domain/entities/music_entity.dart';
import '../../../../music_player/domain/usecases/get_music.dart';

part 'music_list_state.dart';

class MusicListCubit extends Cubit<MusicListState> {
  final GetMusic getMusic;
  final String _defaultQuery = 'Featured';

  MusicListCubit({
    required this.getMusic,
  }) : super(const MusicListState()) {
    loadInitial();
  }

  loadInitial() {
    loadMusicByQuery(query: _defaultQuery);
  }

  loadMusicByQuery({required String query}) async {
    emit(state.copyWith(stateStatus: BlocState.isLoading));

    final musicData = await getMusic(
      GetMusicParams(searchQuery: query.isEmpty ? _defaultQuery : query),
    );

    musicData.fold(
      (failure) => emit(
        state.copyWith(
          errorMessage: failure.errorMessage,
          stateStatus: BlocState.isFailure,
        ),
      ),
      (music) => emit(
        state.copyWith(
          music: music,
          stateStatus: BlocState.isLoaded,
        ),
      ),
    );
  }

  String selectedMusic(int index) {
    emit(state.copyWith(currentIndex: index));
    return state.music[index].previewUrl;
  }
}
