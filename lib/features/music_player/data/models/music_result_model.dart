import 'music_model.dart';

class MusicResultModel {
  final int resultCount;
  final List<MusicModel>? music;

  MusicResultModel({
    required this.resultCount,
    required this.music,
  });

  factory MusicResultModel.fromJson(Map<String, dynamic> json) {
    final resultCount = json['resultCount'];
    final List<MusicModel> resultMusic = <MusicModel>[];

    if (json['results'] != null) {
      json['results'].forEach((v) {
        resultMusic.add(MusicModel.fromJson(v));
      });
    }

    return MusicResultModel(resultCount: resultCount, music: resultMusic);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['resultCount'] = resultCount;

    data['results'] = music?.map((v) => v.toJson()).toList();

    return data;
  }
}
