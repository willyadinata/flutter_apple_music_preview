import 'package:fpdart/fpdart.dart';

import '../../../../common/core/error/exceptions.dart';
import '../../../../common/core/error/failures.dart';
import '../../../music_player/data/datasources/music_remote_data_source.dart';
import '../../../music_player/domain/entities/music_entity.dart';
import '../../domain/repositories/music_repository.dart';

class MusicRepositoryImpl extends MusicRepository {
  final MusicRemoteDataSource remoteDataSource;

  MusicRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<MusicEntity>?>> getMusicBySearch({
    String? searchQuery,
  }) async {
    try {
      final remoteResults =
          await remoteDataSource.getMusicBySearch(searchQuery: searchQuery);
      return Right(remoteResults);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
