/*=========================================================================================
 * Created on Sat Feb 12 2022
 * File Name     : get_it.dart
 * Description   : dependency injection
 * --------------------------------------------------------------------------------------
 * Project Name  : AppleMusicPreview - Flutter
 * Author Name   : Willy Adinata Saragih
 * Author Email  : me@willyadinata.my.id
 * Repo URL      : https://github.com/willyadinata
 * Copyright © 2022 Personal Project
=========================================================================================*/

import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:just_audio/just_audio.dart';

import '../common/core/api/api_client.dart';
import '../features/music_player/data/datasources/music_remote_data_source.dart';
import '../features/music_player/data/repositories/music_repository_impl.dart';
import '../features/music_player/domain/repositories/music_repository.dart';
import '../features/music_player/domain/usecases/get_music.dart';
import '../features/music_player/presentation/blocs/music_list/music_list_cubit.dart';
import '../features/music_player/presentation/blocs/music_player/music_player_cubit.dart';

/// To access the instance of GetIt
final getItInstance = GetIt.I;

Future<void> getItInit() async {
  // Blocs
  getItInstance.registerFactory(
    () => MusicPlayerCubit(audioPlayer: getItInstance()),
  );
  getItInstance.registerFactory(
    () => MusicListCubit(getMusic: getItInstance()),
  );

  // Use Cases
  getItInstance.registerLazySingleton<GetMusic>(
    () => GetMusic(repository: getItInstance()),
  );

  // Repositories
  getItInstance.registerLazySingleton<MusicRepository>(
    () => MusicRepositoryImpl(remoteDataSource: getItInstance()),
  );

  // Data sources
  getItInstance.registerLazySingleton<MusicRemoteDataSource>(
    () => MusicRemoteDataSourceImpl(client: getItInstance()),
  );

  // External
  getItInstance.registerLazySingleton(() => AudioPlayer());
  getItInstance.registerLazySingleton(() => ApiClient(getItInstance()));
  getItInstance.registerLazySingleton(() => Client());
}
