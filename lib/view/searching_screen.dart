import 'package:flutter/material.dart';
import 'package:flutter_application_3/model/details_mc.dart';
import 'package:flutter_application_3/view/detials_screen.dart';

class SearchingScreen extends StatefulWidget {
  final List<Results>? movies;

  SearchingScreen({
    super.key,
    this.movies,
  });

  @override
  State<SearchingScreen> createState() => _SearchingScreenState();
}

class _SearchingScreenState extends State<SearchingScreen> {
  late List<Results> filteredMovies;

  final TextEditingController txtController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredMovies = widget.movies ?? [];
    txtController.addListener(filterMovies);
  }

  void filterMovies() {
    final String query = txtController.text;
    setState(() {
      filteredMovies = widget.movies!
          .where((movie) =>
              movie.title!.contains(query) || movie.overview!.contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 50,
              width: screenWidth * 0.95,
              child: TextFormField(
                controller: txtController,
                autofocus: true,
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
            child: ListView.builder(
              itemCount: filteredMovies.length,
              itemBuilder: (context, index) {
                final result = filteredMovies[index];

                return ListTile(
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
                  leading: Container(
                      height: 70,
                      color: Colors.redAccent,
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w200${result.posterPath}',
                        fit: BoxFit.fill,
                      )),
                  title: Text(
                    result.title ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    result.overview ?? '',
                    style: const TextStyle(color: Colors.grey),
                  ),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}
