import 'package:flutter/material.dart';
import 'package:flutter_application_3/model/details_mc.dart';

@immutable
abstract class UpcomingMoviesState {}

@immutable
class UpComingMoviesLoadingState extends UpcomingMoviesState {}

@immutable
class UpComingMoviesLoadedState extends UpcomingMoviesState {
  final List<Results> movies;

  UpComingMoviesLoadedState({required this.movies});
}

@immutable
class UpComingMoviesErrorState extends UpcomingMoviesState {
  final String error;

  UpComingMoviesErrorState({required this.error});
}
