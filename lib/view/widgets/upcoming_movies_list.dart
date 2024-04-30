import 'package:flutter/material.dart';
import 'package:flutter_application_3/view/detials_screen.dart';
 
class UpcomingMoviesList extends StatelessWidget {
  const UpcomingMoviesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.sizeOf(context).height - kToolbarHeight;
    var screenWidth = MediaQuery.sizeOf(context).width;
    var screenOrientation = MediaQuery.of(context).orientation;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailsScreen(),
                ));
          },
          child: Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 0, 140, 255),
                borderRadius: BorderRadiusDirectional.all(Radius.circular(50))),
            height: screenHeight * 0.3,
            width: screenWidth * 0.86,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(alignment: Alignment.bottomCenter, child: Text('data'))
              ],
            ),
          ),
        ),
        SizedBox(
          height: screenHeight * 0.03,
        )
      ],
    );
  }
}
