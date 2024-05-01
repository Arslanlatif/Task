import 'package:flutter_application_3/controllers/upcomingmoviewBloc/upcoming_movies_events.dart';
import 'package:flutter_application_3/controllers/upcomingmoviewBloc/upcoming_moview_state.dart';
import 'package:flutter_application_3/model/apiProvider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpComingMoviesBloc
    extends Bloc<UpcomingMoviesEvents, UpcomingMoviesState> {
  final UpcomingMoviesApiProvider upcomingMoviesApiProvider;

  UpComingMoviesBloc(this.upcomingMoviesApiProvider)
      : super(UpComingMoviesLoadingState());

  @override
  Stream<UpcomingMoviesState> mapEventToState(
      UpcomingMoviesEvents events) async* {
    if (events is FetchUpcomingMovies) {
      yield UpComingMoviesLoadingState();
      try {
        final movies = await upcomingMoviesApiProvider.fetchMovies();
        yield UpComingMoviesLoadedState(movies: movies);
      } catch (e) {
        yield UpComingMoviesErrorState(error: e.toString());
      }
    }
  }
}
