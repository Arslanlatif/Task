import 'dart:developer';

import 'package:flutter_application_3/controllers/videos_player_bloc.dart/videos_player_movies_events.dart';
import 'package:flutter_application_3/controllers/videos_player_bloc.dart/videos_player_state.dart';
import 'package:flutter_application_3/model/apiProvider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideosPlayerBloc extends Bloc<VideosPlayerEvent, VideosPlayerState> {
  VideosPlayerBloc() : super(VideosPlayerStateInitial()) {
    on<PlaysFetchVideoUrlEvent>((event, emit) async {
      emit(VideosPlayerStateLoading());
      final videoKey = await fetchVideoKeyFromApi(id: event.movieId);
      log(videoKey.toString());

      final videoUrl = 'https://www.youtube.com/watch?v=$videoKey';

      final videoId = YoutubePlayer.convertUrlToId(videoUrl);

      YoutubePlayerController youtubePlayerController = YoutubePlayerController(
          initialVideoId: videoId!,
          flags: const YoutubePlayerFlags(
              autoPlay: true,
              controlsVisibleAtStart: true,
              mute: false,
              loop: false,
              enableCaption: true));

      emit(VideosPlayerStateLoaded(
        youtubeController: youtubePlayerController,
      ));
    });
  }
  void initializeController(String url) {}
}
