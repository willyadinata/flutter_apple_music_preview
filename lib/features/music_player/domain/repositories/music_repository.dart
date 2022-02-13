import 'package:fpdart/fpdart.dart';

import '../../../../common/core/error/failures.dart';
import '../../../music_player/domain/entities/music_entity.dart';

abstract class MusicRepository {
  Future<Either<Failure, List<MusicEntity>?>> getMusicBySearch({
    String? searchQuery,
  });
}
