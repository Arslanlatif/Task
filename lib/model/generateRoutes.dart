// import 'package:flutter/material.dart';
// import 'package:flutter_application_3/view/bottom_nav_screens./upcoming_movies_screen.dart';

// Route onGenerateRoute(RouteSettings settings) {
//   //! MyHomePage
//   if (settings.name == UpcomingMoviesScreen.activityName) {
//     return PageRouteBuilder(
//         pageBuilder: (context, animation, secondaryAnimation) =>
//             const UpcomingMoviesScreen(),
//         transitionsBuilder: (context, animation, secondaryAnimation, child) =>
//             FadeTransition(opacity: animation, child: child),
//         reverseTransitionDuration: const Duration(seconds: 2),
//         transitionDuration: const Duration(seconds: 2));
//   }

//   // //! SplashScreen
//   // else if (settings.name == SplashScreen.activityName) {
//   //   return MaterialPageRoute(
//   //     builder: (context) => const SplashScreen(),
//   //   );
//   // }

//   // //! GetStartedScreen
//   // else if (settings.name == GetStartedScreen.activityName) {
//   //   return MaterialPageRoute(
//   //     builder: (context) => const GetStartedScreen(),
//   //   );
//   // }

//   // //! SignInScreen
//   // else if (settings.name == SignInScreen.activityName) {
//   //   return PageRouteBuilder(
//   //       pageBuilder: (context, animation, secondaryAnimation) =>
//   //           const SignInScreen(),
//   //       transitionsBuilder: (context, animation, secondaryAnimation, child) =>
//   //           SlideTransition(
//   //             position: Tween(begin: const Offset(-1, 0), end: Offset.zero)
//   //                 .animate(animation),
//   //             child: child,
//   //           ),
//   //       reverseTransitionDuration: const Duration(milliseconds: 500),
//   //       transitionDuration: const Duration(milliseconds: 500));
//   // }

//   // //! SignUpScreen
//   // else if (settings.name == SignUpScreen.activityName) {
//   //   return PageRouteBuilder(
//   //       pageBuilder: (context, animation, secondaryAnimation) =>
//   //           const SignUpScreen(),
//   //       transitionsBuilder: (context, animation, secondaryAnimation, child) =>
//   //           FadeTransition(opacity: animation, child: child),
//   //       reverseTransitionDuration: const Duration(seconds: 1),
//   //       transitionDuration: const Duration(seconds: 1));
//   // }

//   // // ! HomeScreen
//   // else if (settings.name == HomeScreen.activityName) {
//   //   return MaterialPageRoute(
//   //     builder: (context) => const HomeScreen(),
//   //   );
//   // }

//   // // ! Search Screen
//   // else if (settings.name == SearchScreen.activityName) {
//   //   return PageRouteBuilder(
//   //       pageBuilder: (context, animation, secondaryAnimation) =>
//   //           const SearchScreen(),
//   //       transitionDuration: const Duration(seconds: 1),
//   //       reverseTransitionDuration: const Duration(seconds: 1));
//   // }

//   // ! ProfileScreen
//   else {
//     return MaterialPageRoute(
//       builder: (context) => const UpcomingMoviesScreen(),
//     );
//   }
// }
