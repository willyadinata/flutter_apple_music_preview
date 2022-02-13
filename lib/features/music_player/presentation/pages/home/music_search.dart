import 'dart:async';

import 'package:applemusic/di/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../blocs/music_list/music_list_cubit.dart';

class MusicSearch extends StatefulWidget {
  const MusicSearch({
    Key? key,
  }) : super(key: key);

  @override
  State<MusicSearch> createState() => _MusicSearchState();
}

class _MusicSearchState extends State<MusicSearch> {
  late TextEditingController _controller;
  Timer? _debounce;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounce!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AudioPlayer _audioPlayer = getItInstance<AudioPlayer>();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF000000),
            offset: Offset(0.0, 0.20),
            blurRadius: 0.10,
            spreadRadius: 0.1,
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Search Other Music Like "Lyodra"',
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
              onChanged: (query) {
                if (_debounce?.isActive ?? false) _debounce!.cancel();
                _debounce = Timer(const Duration(seconds: 1), () {
                  context.read<MusicListCubit>().loadMusicByQuery(query: query);
                  _audioPlayer.stop();
                });
              },
            ),
          ),
          if (_controller.text.isNotEmpty)
            GestureDetector(
              onTap: () {
                _controller.text = '';
                FocusScope.of(context).unfocus();
                context.read<MusicListCubit>().loadMusicByQuery(query: '');
              },
              child: const Icon(Icons.clear),
            ),
        ],
      ),
    );
  }
}
