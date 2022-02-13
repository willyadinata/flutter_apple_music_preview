import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../common/core/error/failures.dart';
import '../../../../common/core/usecases/usecase.dart';
import '../../../music_player/domain/entities/music_entity.dart';
import '../../../music_player/domain/repositories/music_repository.dart';

class GetMusic implements UseCase<List<MusicEntity>?, GetMusicParams> {
  final MusicRepository repository;

  GetMusic({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<MusicEntity>?>> call(
      GetMusicParams params) async {
    return await repository.getMusicBySearch(searchQuery: params.searchQuery);
  }
}

class GetMusicParams extends Equatable {
  final String searchQuery;

  const GetMusicParams({
    required this.searchQuery,
  });

  @override
  List<Object> get props => [searchQuery];
}
