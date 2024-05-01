// ignore_for_file: public_member_api_docs, sort_constructors_first
 
 import 'package:flutter/material.dart';
import 'package:flutter_application_3/view/seats_booking_screens/ticket_screen.dart';
 
 
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.sizeOf(context).height;
    var screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: SizedBox(
                height: screenHeight * 0.5,
                child: Stack(
                  children: [
                    //? Image container
                    Container(
                      color: Colors.green,
                      width: screenWidth,
                      height: screenHeight * 0.5,
                      child: const FlutterLogo(
                        size: 300,
                      ),
                    ),
                    //? back Icon button
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_outlined,
                              color: Colors.white,
                            )),
                        Text(
                          'Watch',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.07),
                        ),
                      ],
                    ),
                    //? Buttons
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.23, left: screenWidth * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 88, 180, 255),
                                  fixedSize: Size(
                                      screenWidth * 0.9, screenHeight * 0.08),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {
                                //
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const TicketScreen(),
                                    ));
                              },
                              child: const Text(
                                'Buy Ticket',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                          SizedBox(height: screenHeight * 0.01),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                      screenWidth * 0.9, screenHeight * 0.08),
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      side:
                                          const BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const TicketScreen(),
                                    ));
                              },
                              child: const Text(
                                'Watch Trailer',
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Chip(
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.transparent),
                        ),
                        label: Text(
                          'Genres',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenHeight * 0.02),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: screenWidth * 0.15),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Chip(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(13))),
                            backgroundColor: Color.fromARGB(255, 129, 221, 132),
                            label: Text(
                              'Action',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Chip(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(13))),
                            backgroundColor: Color.fromARGB(255, 11, 135, 237),
                            label: Text(
                              'Adventure',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Chip(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(13))),
                            backgroundColor: Color.fromARGB(255, 29, 240, 36),
                            label: Text(
                              'Darama',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: screenWidth * 0.73, top: screenHeight * 0.05),
                      child: Text(
                        'OverView',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenHeight * 0.02),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.04, top: screenHeight * 0.02),
                      child: Text(
                        'Ove rView lkgjsd lkj hf lksd jflksdj flkjlk fjsd ljskgh fdjkfhsdf fsdfhsdkfn fsdf Ove rView lkgjsd lkj hf lksd jflksdj flkjlk fjsd ljskgh fdjkfhsdf fsdfhsdkfn fsdf',
                        style: TextStyle(fontSize: screenHeight * 0.02),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
