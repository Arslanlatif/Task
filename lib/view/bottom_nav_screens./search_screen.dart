// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_application_3/model/details_mc.dart';
import 'package:flutter_application_3/view/detials_screen.dart';
import 'package:flutter_application_3/view/searching_screen.dart';

class SearchScreen extends StatelessWidget {
  final List<Results>? movies;

  SearchScreen({
    super.key,
    this.movies,
  });

  final TextEditingController txtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height -
        kToolbarHeight -
        kBottomNavigationBarHeight;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 50,
              width: 300,
              child: TextFormField(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchingScreen(movies: movies,),
                    )),
                controller: txtController,
                readOnly: true,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                        onPressed: () {
                          txtController.clear();
                        },
                        icon: const Icon(Icons.close)),
                    hintText: 'Search movies',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
          ),
          Expanded(
              flex: 9,
              child: GridView.builder(
                itemCount: 20,
                padding: const EdgeInsets.all(20),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 7, mainAxisSpacing: 2, crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final result = movies![index];

                  return InkWell(
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
                    child: Card(
                      color: Colors.red,
                      elevation: 20,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Stack(
                        children: [
                          Image.network(
                            'https://image.tmdb.org/t/p/w200${result.posterPath}',
                            fit: BoxFit.fill,
                            width: screenWidth * 0.5,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: screenHeight * 0.17,
                                left: screenWidth * 0.05),
                            child: Text(
                              result.title ?? '',
                              style: const TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ))
        ]),
      ),
    );
  }
}
