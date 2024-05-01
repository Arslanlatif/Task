import 'package:flutter/material.dart';
 import 'package:flutter_application_3/controllers/upcomingmoviewBloc/upcoming_movies_bloc.dart';
import 'package:flutter_application_3/controllers/upcomingmoviewBloc/upcoming_movies_events.dart';
import 'package:flutter_application_3/controllers/upcomingmoviewBloc/upcoming_moview_state.dart';
import 'package:flutter_application_3/model/details_mc.dart';
import 'package:flutter_application_3/view/bottom_nav_screens./search_screen.dart';
import 'package:flutter_application_3/view/detials_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingMoviesScreen extends StatefulWidget {
  const UpcomingMoviesScreen({super.key});

  @override
  State<UpcomingMoviesScreen> createState() => _UpcomingMoviesScreenState();
}

class _UpcomingMoviesScreenState extends State<UpcomingMoviesScreen> {
 
 
  @override
  void initState() {
    super.initState();
    context.read<UpcomingMoviesStateBloc>().add(FetchUpcomingMoviesEvent());
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height -
        kToolbarHeight -
        kBottomNavigationBarHeight;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Watch'),
        actions: [
          IconButton(
               onPressed: () {
              final state = context.read<UpcomingMoviesStateBloc>().state;
              if (state is UpcomingMoviesStateLoaded) {
                final List<Results> movies = state.details.results!;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(movies: movies),
                  ),
                );
              }
            },
            icon: const Icon(Icons.search),)
        ],
      ),
      body: BlocBuilder<UpcomingMoviesStateBloc, UpcomingMoviesState>(
        builder: (context, state) {
          if (state is UpcomingMoviesStateLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UpcomingMoviesStateLoaded) {
            return ListView.builder(
              itemCount: state.details.results!.length,
              itemBuilder: (context, index) {
                final result = state.details.results![index];
                 
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          imageUrl:
                              'https://image.tmdb.org/t/p/w200${result.posterPath}',
                          details: result.overview ?? '',
                          title: result.title ?? '',
                          date: result.releaseDate ?? '',
                          id: result.id,
                        ),
                      )),
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 50),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 0, 140, 255),
                        borderRadius:
                            BorderRadiusDirectional.all(Radius.circular(10))),
                    height: screenHeight * 0.3,
                    width: screenWidth * 0.89,
                    child: Stack(
                      children: [
                        result.posterPath != null
                            ? Align(
                                alignment: Alignment.center,
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/w200${result.posterPath}',
                                  fit: BoxFit.fill,
                                  height: screenHeight * 0.3,
                                  width: screenWidth * 0.8,
                                ),
                              )
                            : const SizedBox(width: 50, height: 50),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              result.title ?? '',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is UpcomingMoviesStateError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(
                child: Text('Press the button to load details'));
          }
        },
      ),
    );
  }
}
