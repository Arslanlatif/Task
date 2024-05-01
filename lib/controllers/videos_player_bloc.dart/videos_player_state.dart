import 'package:flutter_application_3/model/VPModelClass.dart';
import 'package:flutter_application_3/model/details_mc.dart';

abstract class VideosPlayerState {
  const VideosPlayerState();
}

class VideosPlayerStateInitial extends VideosPlayerState {}

class VideosPlayerStateLoading extends VideosPlayerState {}

class VideosPlayerStateLoaded extends VideosPlayerState {
  final VPModelClass videos;

  const VideosPlayerStateLoaded(this.videos);
}

class VideosPlayerStateStateError extends VideosPlayerState {
  final String message;

  const VideosPlayerStateStateError(this.message);
}
