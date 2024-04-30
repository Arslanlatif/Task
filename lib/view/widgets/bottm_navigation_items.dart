import 'package:flutter/material.dart';
import 'package:flutter_application_3/view/home_screen.dart';
import 'package:flutter_application_3/view/search_screen.dart'; 

class BottomNavigationItems extends StatefulWidget {
  const BottomNavigationItems({super.key});

  @override
  _BottomNavigationItemsState createState() => _BottomNavigationItemsState();
}

class _BottomNavigationItemsState extends State<BottomNavigationItems> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: _currentIndex,
        fixedColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              label: 'Home',
              icon: IconButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      )),
                  icon: const Icon(Icons.home))),
          BottomNavigationBarItem(
              label: 'Search',
              icon: IconButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(),
                      )),
                  icon: const Icon(Icons.search))),
          BottomNavigationBarItem(
              label: 'Favorite', icon: const Icon(Icons.favorite)),
          BottomNavigationBarItem(
              label: 'Profile', icon: const Icon(Icons.person))
        ]);
  }
}
