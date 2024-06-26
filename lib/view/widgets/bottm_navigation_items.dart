import 'package:flutter/material.dart';

class BottomNavigatoinItems extends StatelessWidget {
  const BottomNavigatoinItems(
      {super.key, required this.currentIndex, required this.onTap});

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.sizeOf(context).height;
    var screenWidth = MediaQuery.sizeOf(context).width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(58),
      child: Container(
        width: screenWidth * 0.96,
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
