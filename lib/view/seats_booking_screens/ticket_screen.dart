import 'package:flutter/material.dart';

import 'package:flutter_application_3/view/seats_booking_screens/payment_screen.dart';

class TicketScreen extends StatelessWidget {
  String? title;
  String? date;

  TicketScreen({
    super.key,
    this.title,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.sizeOf(context).height;
    var screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 246, 246),
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title ?? '',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth * 0.08,
                    fontWeight: FontWeight.bold)),
            Text('In Theaters  $date',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.05, right: screenWidth * 0.75),
              child: const Text('Date',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: screenHeight * 0.08,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                padding: const EdgeInsets.all(10),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Chip(
                        elevation: 10,
                        shadowColor: const Color.fromARGB(255, 214, 212, 212),
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(10)),
                        label: Text(
                          '${index + 1} march',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )),
                  );
                },
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: ListView.builder(
                itemCount: 10,
                padding: const EdgeInsets.all(10),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: screenHeight * 0.3,
                    width: screenWidth * 0.6,
                    margin: const EdgeInsets.symmetric(horizontal: 7),
                    // color: Colors.green,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                              text: '12:30',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: '  Cinetech + Hall',
                              style: TextStyle(
                                color: Colors.grey,
                              ))
                        ])),
                        Image.asset('assets/images/seats_image.jpg',
                            fit: BoxFit.contain),
                        RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                              text: 'From',
                              style: TextStyle(
                                color: Colors.grey,
                              )),
                          TextSpan(
                              text: '  50',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: '  or',
                              style: TextStyle(
                                color: Colors.grey,
                              )),
                          TextSpan(
                              text: '   s2500 bonus',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold))
                        ])),
                      ],
                    ),
                  );
                },
              )),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.14, bottom: screenHeight * 0.05),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 89, 175, 245),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      fixedSize: Size(screenWidth * 0.9, screenHeight * 0.1)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentScreen(
                                  date: date,
                                  title: title,
                                )));
                  },
                  child: const Text('Select Seats',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))),
            ),
          )
        ],
      ),
    );
  }
}
