import '../../domain/entities/music_entity.dart';

class MusicModel extends MusicEntity {
  final String? wrapperType;
  final String? kind;
  final int? artistId;
  final int? collectionId;
  final int? trackId;
  final String? collectionCensoredName;
  final String? trackCensoredName;
  final String? artistViewUrl;
  final String? collectionViewUrl;
  final String? trackViewUrl;
  final double? collectionPrice;
  final double? trackPrice;
  final String? collectionExplicitness;
  final String? trackExplicitness;
  final int? discCount;
  final int? discNumber;
  final int? trackCount;
  final int? trackNumber;
  final int? trackTimeMillis;
  final String? country;
  final String? currency;
  final String? primaryGenreName;
  final bool? isStreamable;

  const MusicModel({
    this.wrapperType,
    this.kind,
    this.artistId,
    this.collectionId,
    this.trackId,
    required String artistName,
    required String collectionName,
    required String trackName,
    this.collectionCensoredName,
    this.trackCensoredName,
    this.artistViewUrl,
    this.collectionViewUrl,
    this.trackViewUrl,
    required String previewUrl,
    required String artworkUrl30,
    required String artworkUrl60,
    required String artworkUrl100,
    this.collectionPrice,
    this.trackPrice,
    required String releaseDate,
    this.collectionExplicitness,
    this.trackExplicitness,
    this.discCount,
    this.discNumber,
    this.trackCount,
    this.trackNumber,
    this.trackTimeMillis,
    this.country,
    this.currency,
    this.primaryGenreName,
    this.isStreamable,
  }) : super(
          artistName: artistName,
          collectionName: collectionName,
          trackName: trackName,
          previewUrl: previewUrl,
          artworkUrl30: artworkUrl30,
          artworkUrl60: artworkUrl60,
          artworkUrl100: artworkUrl100,
          releaseDate: releaseDate,
        );

  factory MusicModel.fromJson(Map<String, dynamic> json) {
    return MusicModel(
      wrapperType: json['wrapperType'] ?? '',
      kind: json['kind'] ?? '',
      artistId: json['artistId'],
      collectionId: json['collectionId'],
      trackId: json['trackId'],
      artistName: json['artistName'] ?? '',
      collectionName: json['collectionName'] ?? '',
      trackName: json['trackName'] ?? '',
      collectionCensoredName: json['collectionCensoredName'] ?? '',
      trackCensoredName: json['trackCensoredName'] ?? '',
      artistViewUrl: json['artistViewUrl'] ?? '',
      collectionViewUrl: json['collectionViewUrl'] ?? '',
      trackViewUrl: json['trackViewUrl'] ?? '',
      previewUrl: json['previewUrl'] ?? '',
      artworkUrl30: json['artworkUrl30'] ?? '',
      artworkUrl60: json['artworkUrl60'] ?? '',
      artworkUrl100: json['artworkUrl100'] ?? '',
      collectionPrice: json['collectionPrice'],
      trackPrice: json['trackPrice'],
      releaseDate: json['releaseDate'] ?? '',
      collectionExplicitness: json['collectionExplicitness'] ?? '',
      trackExplicitness: json['trackExplicitness'] ?? '',
      discCount: json['discCount'],
      discNumber: json['discNumber'],
      trackCount: json['trackCount'],
      trackNumber: json['trackNumber'],
      trackTimeMillis: json['trackTimeMillis'],
      country: json['country'] ?? '',
      currency: json['currency'] ?? '',
      primaryGenreName: json['primaryGenreName'] ?? '',
      isStreamable: json['isStreamable'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wrapperType'] = wrapperType;
    data['kind'] = kind;
    data['artistId'] = artistId;
    data['collectionId'] = collectionId;
    data['trackId'] = trackId;
    data['artistName'] = artistName;
    data['collectionName'] = collectionName;
    data['trackName'] = trackName;
    data['collectionCensoredName'] = collectionCensoredName;
    data['trackCensoredName'] = trackCensoredName;
    data['artistViewUrl'] = artistViewUrl;
    data['collectionViewUrl'] = collectionViewUrl;
    data['trackViewUrl'] = trackViewUrl;
    data['previewUrl'] = previewUrl;
    data['artworkUrl30'] = artworkUrl30;
    data['artworkUrl60'] = artworkUrl60;
    data['artworkUrl100'] = artworkUrl100;
    data['collectionPrice'] = collectionPrice;
    data['trackPrice'] = trackPrice;
    data['releaseDate'] = releaseDate;
    data['collectionExplicitness'] = collectionExplicitness;
    data['trackExplicitness'] = trackExplicitness;
    data['discCount'] = discCount;
    data['discNumber'] = discNumber;
    data['trackCount'] = trackCount;
    data['trackNumber'] = trackNumber;
    data['trackTimeMillis'] = trackTimeMillis;
    data['country'] = country;
    data['currency'] = currency;
    data['primaryGenreName'] = primaryGenreName;
    data['isStreamable'] = isStreamable;
    return data;
  }
}
