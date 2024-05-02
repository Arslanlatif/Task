import 'dart:developer';

import 'package:flutter_application_3/controllers/upcomingmoviewBloc/upcoming_movies_events.dart';
import 'package:flutter_application_3/controllers/upcomingmoviewBloc/upcoming_moview_state.dart';
import 'package:flutter_application_3/model/apiProvider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity/connectivity.dart';

class UpcomingMoviesStateBloc
    extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  UpcomingMoviesStateBloc() : super(UpcomingMoviesStateInitial()) {
    on<FetchUpcomingMoviesEvent>(_onFetchDetails);
  }

  void _onFetchDetails(
      FetchUpcomingMoviesEvent event, Emitter<UpcomingMoviesState> emit) async {
    emit(UpcomingMoviesStateLoading());

    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      log('No internet connection');
    } else {
      try {
        final details = await fetchDetailsFromApi();
        emit(UpcomingMoviesStateLoaded(details));
      } catch (e) {
        emit(UpcomingMoviesStateError('Failed to fetch details: $e'));
      }
    }
  }
}
