import 'package:flutter/material.dart';
import 'package:flutter_application_3/view/search_screen.dart';
import 'package:flutter_application_3/view/widgets/bottm_navigation_items.dart';
import 'package:flutter_application_3/view/widgets/upcoming_movies_list.dart'; 

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const activityName = '/homeScreen';

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.sizeOf(context).height -
        kToolbarHeight -
        kBottomNavigationBarHeight;
    var screenWidth = MediaQuery.sizeOf(context).width;

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
      body: SizedBox(
        height: screenHeight,
        child: ListView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: 10,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return const UpcomingMoviesList();
          },
        ),
      ),
      bottomNavigationBar: Container(
          width: screenWidth * 0.7,
          decoration: BoxDecoration(
              color: Colors.brown, borderRadius: BorderRadius.circular(20)),
          child: const BottomNavigationItems()),
    );
  }
}
