import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_application_3/controllers/videos_player_bloc.dart/videos_player_movies_events.dart';
import 'package:flutter_application_3/controllers/videos_player_bloc.dart/videos_player_state.dart';
import 'package:flutter_application_3/model/apiProvider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class VideosPlayerBloc extends Bloc<VideosPlayerEvent, VideosPlayerState> {
  VideosPlayerBloc() : super(VideosPlayerStateInitial()) {
    on<PlaysFetchVideoUrlEvent>((event, emit) async {
      emit(VideosPlayerStateLoading());

      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        log('No internet connection');
      }
      final vmModel = await fetchVieoFromApi(id: event.movieId);
      log(vmModel.toJson().toString());

      final videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"));
      await videoPlayerController.initialize();
      final chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: false,
        allowMuting: true,
        allowFullScreen: true,
        allowPlaybackSpeedChanging: true,
        hideControlsTimer: const Duration(seconds: 5),
        showControls: true,
        aspectRatio: videoPlayerController.value.aspectRatio,
        allowedScreenSleep: true,
        subtitle: Subtitles([
          Subtitle(
              index: 1,
              start: const Duration(milliseconds: 200),
              end: const Duration(milliseconds: 200),
              text: 'This is subtitle ')
        ]),
      );

      emit(VideosPlayerStateLoaded(
        chewieController: chewieController,
        videos: vmModel,
        videoPlayerController: videoPlayerController,
      ));
    });
  }
  void initializeController(String url) {}
}
