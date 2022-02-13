import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/core/enums/enums.dart';
import '../../../../music_player/presentation/blocs/music_player/music_player_cubit.dart';
import '../../blocs/music_list/music_list_cubit.dart';

class MusicList extends StatelessWidget {
  const MusicList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MusicPlayerCubit _musicPlayerCubit =
        context.watch<MusicPlayerCubit>();

    return BlocBuilder<MusicListCubit, MusicListState>(
      builder: (context, state) {
        if (state.stateStatus == BlocState.isLoaded) {
          return ListView.separated(
            itemCount: state.music.length,
            separatorBuilder: (context, i) => const Divider(),
            itemBuilder: (context, i) => ListTile(
              onTap: () {
                final _music = context.read<MusicListCubit>().selectedMusic(i);
                context.read<MusicPlayerCubit>().loadMusic(_music);
              },
              isThreeLine: true,
              leading: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  state.music[i].artworkUrl30,
                ),
              ),
              title: Text(state.music[i].trackName),
              subtitle: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Author: ${state.music[i].artistName}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Album: ${state.music[i].collectionName}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              trailing: _musicPlayerCubit.state.playerState ==
                          AudioPlayerState.playing &&
                      state.currentIndex == i
                  ? const Text('Playing')
                  : const SizedBox.shrink(),
            ),
          );
        } else if (state.stateStatus == BlocState.isFailure) {
          return const Center(
            child: Text('Error Get Data'),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
