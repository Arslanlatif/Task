import 'package:flutter/material.dart';

class SearchingScreen extends StatelessWidget {
  SearchingScreen({super.key});

  final TextEditingController txtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                      height: 70,
                      color: Colors.redAccent,
                      child: FlutterLogo(size: 30)),
                  title: Text(
                    'HarryPotter',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('js fkjh sdk fjh sdj kf h jfsdkh'),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}
