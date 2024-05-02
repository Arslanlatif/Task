import 'package:chewie/chewie.dart';
import 'package:flutter_application_3/model/VPModelClass.dart';
 import 'package:video_player/video_player.dart';

abstract class VideosPlayerState {
  const VideosPlayerState();
}

class VideosPlayerStateInitial extends VideosPlayerState {}

class VideosPlayerStateLoading extends VideosPlayerState {}

class VideosPlayerStateLoaded extends VideosPlayerState {
  final VPModelClass videos;
  final VideoPlayerController videoPlayerController;
  final ChewieController chewieController;
  
  VideosPlayerStateLoaded(
      {required this.videos,
      required this.chewieController,
      required this.videoPlayerController});
}

class VideosPlayerStateStateError extends VideosPlayerState {
  final String message;

  const VideosPlayerStateStateError(this.message);
}
