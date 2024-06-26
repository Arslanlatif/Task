import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_3/controllers/videos_player_bloc.dart/videos_player_bloc.dart';
import 'package:flutter_application_3/controllers/videos_player_bloc.dart/videos_player_movies_events.dart';
import 'package:flutter_application_3/controllers/videos_player_bloc.dart/videos_player_state.dart';
import 'package:flutter_application_3/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerPlayerSCreen extends StatefulWidget {
  TrailerPlayerSCreen({super.key, required this.id, required this.title});
  int id;
  String title;

  @override
  State<TrailerPlayerSCreen> createState() => _TrailerPlayerSCreenState();
}

class _TrailerPlayerSCreenState extends State<TrailerPlayerSCreen> {
  late VideosPlayerBloc videosPlayerBloc;
  @override
  void initState() {
    super.initState();
    videosPlayerBloc = BlocProvider.of<VideosPlayerBloc>(context);
    videosPlayerBloc.add(PlaysFetchVideoUrlEvent(widget.id));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([]);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 36, 35, 35),
        appBar: AppBar(
            backgroundColor: Colors.white.withOpacity(0.0),
            title: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
              ),
            )),
        body: BlocBuilder<VideosPlayerBloc, VideosPlayerState>(
          builder: (context, state) {
            if (state is VideosPlayerStateLoaded) {
              return Center(
                child: YoutubePlayer(
                  controller: state.youtubeController,
                  showVideoProgressIndicator: true,
                  onEnded: (metaData) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      )),
                ),
              );
            }
            return Center(
                child: Container(
              color: const Color.fromARGB(255, 36, 35, 35),
              child: const Center(
                  child: CircularProgressIndicator(
                color: Color.fromARGB(255, 255, 17, 0),
              )),
            ));
          },
        ));
  }
}
