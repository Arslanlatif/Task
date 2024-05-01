import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.sizeOf(context).height;
    var screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 246, 246),
      appBar: AppBar(
        centerTitle: true,
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Name',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            Text('In Theaters',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Container(
                height: screenHeight * 0.3,
                width: screenWidth * 0.6,
                margin: const EdgeInsets.symmetric(horizontal: 7),
                // color: Colors.green,
                child: Image.asset('assets/images/seats_image.jpg',
                    fit: BoxFit.contain),
              )),
          Expanded(
              flex: 4,
              child: Container(
                height: screenHeight * 0.3,
                width: screenWidth * 0.9,
                margin: const EdgeInsets.symmetric(horizontal: 7),
                // color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Text('Selected'), Text('Not Available')],
                    ),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Text('VIP (150)'), Text('Regular (50)')],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.14),
                      child: const Chip(
                        elevation: 10,
                        shadowColor: Colors.black,
                        label: Text('4/3 row '),
                      ),
                    )
                  ],
                ),
              )),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.2,
                  // color: Colors.green,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total Price',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        '50',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.08,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 89, 175, 245),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          fixedSize:
                              Size(screenWidth * 0.7, screenHeight * 0.1)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PaymentScreen()));
                      },
                      child: const Text('Select Seats',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
