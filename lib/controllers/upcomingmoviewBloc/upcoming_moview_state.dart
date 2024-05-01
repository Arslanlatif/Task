import 'package:flutter_application_3/model/details_mc.dart';

abstract class UpcomingMoviesState {
  const UpcomingMoviesState();
}

class UpcomingMoviesStateInitial extends UpcomingMoviesState {}

class UpcomingMoviesStateLoading extends UpcomingMoviesState {}

class UpcomingMoviesStateLoaded extends UpcomingMoviesState {
  final DetailsModelClass details;

  const UpcomingMoviesStateLoaded(this.details);
}

class UpcomingMoviesStateError extends UpcomingMoviesState {
  final String message;

  const UpcomingMoviesStateError(this.message);
}
