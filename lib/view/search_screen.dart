 import 'package:flutter/material.dart';
import 'package:flutter_application_3/view/searching_screen.dart';
  
class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

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
                      builder: (context) => SearchingScreen(),
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
                  return Card(
                    color: Colors.red,
                    elevation: 20,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    // height: screenHeight * 0.2,
                    // width: screenWidth * 0.42,
                    // decoration: BoxDecoration(
                    //     color: const Color.fromARGB(255, 255, 17, 0),
                    //     borderRadius: BorderRadius.circular(20)),
                    child: Stack(
                      children: [
                        const FlutterLogo(
                          size: 100,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: screenHeight * 0.17,
                              left: screenWidth * 0.05),
                          child: const Text(
                            'Harry Potte',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ))
        ]),
      ),
    );
  }
}
