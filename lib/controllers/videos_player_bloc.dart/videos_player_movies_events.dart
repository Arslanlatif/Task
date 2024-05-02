abstract class VideosPlayerEvent {
  const VideosPlayerEvent();
}

class PlaysFetchVideoUrlEvent extends VideosPlayerEvent {
  int movieId;

  PlaysFetchVideoUrlEvent(this.movieId);
}

class PlaysEventEvent extends VideosPlayerEvent {}
