// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localllllll/Profile_in.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: PageView(
            children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/images/on_boarding_images/Online_Delivery_Service.gif"),
                        Text(
                          "Your wishlist now within arms reach.",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 116, 216, 119)),
                            padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30, vertical: 10))
                          ),
                          onPressed: (){
                            Profilescreen(),
                          },
                          child: Text(
                            "Begin Shopping",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              // color: Colors.white
                            )
                          )
                        ),
                      ],
                  ),
                )
            ],
        ),
      )
    );
  }
}
