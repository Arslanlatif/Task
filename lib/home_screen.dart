import 'package:flutter/material.dart';
import 'package:flutter_application_3/view/bottom_nav_screens./favourite_screen.dart';
import 'package:flutter_application_3/view/bottom_nav_screens./profile_screen.dart';
import 'package:flutter_application_3/view/bottom_nav_screens./search_screen.dart';
import 'package:flutter_application_3/view/bottom_nav_screens./upcoming_movies_screen.dart';
import 'package:flutter_application_3/view/widgets/bottm_navigation_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

//! List of bottomNavigationBar's Screens
  final List<Widget> screens = [
    const UpcomingMoviesScreen(),
    SearchScreen(),
    const ProfileScreen(),
    const FavouriteScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: BottomNavigatoinItems(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
