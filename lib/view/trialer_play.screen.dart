// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
//  import 'package:video_player/video_player.dart';

 
// class TrailerPlayerSCreen extends StatefulWidget {
//   const TrailerPlayerSCreen({super.key });
  
//   @override
//   State<TrailerPlayerSCreen> createState() => _TrailerPlayerSCreenState();
// }

// class _TrailerPlayerSCreenState extends State<TrailerPlayerSCreen> {
//   late VideoPlayerController _videoPlayerController;
//   late ChewieController _chewieController;

//   @override
//   void initState() {
//     super.initState();
//     _videoPlayerController =
//         VideoPlayerController.asset(videoUrl)
//           ..addListener(() {
//             setState(() {});
//           });
//     _chewieController = _chewieController = ChewieController(
//       videoPlayerController: _videoPlayerController,
//       autoPlay: true,
//       looping: true,
//       allowMuting: true,
//       allowFullScreen: true,
//       allowPlaybackSpeedChanging: true,
//       hideControlsTimer: const Duration(seconds: 5),
//       showControls: true,
//       aspectRatio: _videoPlayerController.value.aspectRatio,
//       allowedScreenSleep: true,
//       subtitle: Subtitles([
//         Subtitle(
//             index: 1,
//             start: const Duration(milliseconds: 200),
//             end: const Duration(milliseconds: 200),
//             text: 'This is subtitle ')
//       ]),
//     );
//   }

//   @override
//   void dispose() {
//     _chewieController.dispose();
//     _videoPlayerController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 36, 35, 35),
//       appBar: AppBar(
//         backgroundColor: Colors.black.withOpacity(0.6),
//         title: Text(
//           widget.modelClassOfData.title,
//           style: const TextStyle(color: Colors.white),
//         ),
//       ),
//       body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//         Expanded(
//             child: _chewieController.videoPlayerController.value.isInitialized
//                 ? AspectRatio(
//                     aspectRatio: _chewieController
//                         .videoPlayerController.value.aspectRatio,
//                     child: Chewie(controller: _chewieController),
//                   )
//                 : Container(
//                     color: const Color.fromARGB(255, 36, 35, 35),
//                     child: const Center(
//                         child: CircularProgressIndicator(
//                       color: Color.fromARGB(255, 255, 17, 0),
//                     )),
//                   )),
//       ]),
//     );
//   }
// }