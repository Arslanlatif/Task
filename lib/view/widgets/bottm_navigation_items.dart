import 'package:flutter/material.dart';

class BottomNavigatoinItems extends StatelessWidget {
  const BottomNavigatoinItems(
      {super.key, required this.currentIndex, required this.onTap});

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(78),
      child: Container(
        width: 400,
        height: 90,
        decoration: BoxDecoration(
            color: Colors.brown, borderRadius: BorderRadius.circular(120)),
        child: BottomNavigationBar(
            currentIndex: currentIndex,
            fixedColor: Colors.black,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.brown,
            onTap: onTap,
            items: const [
              BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  label: 'Favorite', icon: Icon(Icons.favorite)),
              BottomNavigationBarItem(
                  label: 'Profile', icon: Icon(Icons.person))
            ]),
      ),
    );
  }
}
