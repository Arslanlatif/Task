import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class VideosPlayerState {
  const VideosPlayerState();
}

class VideosPlayerStateInitial extends VideosPlayerState {}

class VideosPlayerStateLoading extends VideosPlayerState {}

class VideosPlayerStateLoaded extends VideosPlayerState {
  final YoutubePlayerController youtubeController;

  VideosPlayerStateLoaded({
    required this.youtubeController,
  });
}

class VideosPlayerStateStateError extends VideosPlayerState {
  final String message;

  const VideosPlayerStateStateError(this.message);
}
