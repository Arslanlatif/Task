import 'package:flutter/material.dart';
import 'package:flutter_application_3/controllers/upcomingmoviewBloc/upcoming_movies_bloc.dart';
import 'package:flutter_application_3/controllers/upcomingmoviewBloc/upcoming_moview_state.dart';
import 'package:flutter_application_3/model/apiProvider.dart';
import 'package:flutter_application_3/view/bottom_nav_screens./search_screen.dart';
import 'package:flutter_application_3/view/widgets/upcoming_movies_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingMoviesScreen extends StatelessWidget {
  const UpcomingMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height -
        kToolbarHeight -
        kBottomNavigationBarHeight;
  final UpComingMoviesBloc moviesBloc =
        BlocProvider.of<UpComingMoviesBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Watch'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(),
                      ));
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: BlocBuilder<UpComingMoviesBloc, UpcomingMoviesState>(
          bloc: moviesBloc,
          builder: (context, state) {
            if (state is UpComingMoviesLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UpComingMoviesLoadedState) {
              SizedBox(
                height: screenHeight,
                child: ListView.builder(
                  padding: const EdgeInsets.all(15),
                  itemCount: state.movies.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return UpcomingMoviesList(
                      movies: state.movies[index],
                    );
                  },
                ),
              );
            } else if (state is UpComingMoviesErrorState) {
              return Center(child: Text(state.error));
            }
            return Container();
          },
        ));
  }
}
