import '../../../../common/core/api/api_client.dart';
import '../../../../common/core/api/api_const.dart';
import '../../../music_player/data/models/music_model.dart';
import '../../../music_player/data/models/music_result_model.dart';

abstract class MusicRemoteDataSource {
  Future<List<MusicModel>?> getMusicBySearch({String? searchQuery});
}

class MusicRemoteDataSourceImpl extends MusicRemoteDataSource {
  final ApiClient client;

  MusicRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<List<MusicModel>?> getMusicBySearch({
    String? searchQuery,
  }) async {
    final response = await client.get(ApiConst.searchPath, queryParameters: {
      'term': '$searchQuery',
      'media': 'music',
      'limit': '20',
    });

    return MusicResultModel.fromJson(response).music;
  }
}
