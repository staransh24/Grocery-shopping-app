import 'package:first_time/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(100, 110, 80, 40),
            child: Image.asset('lib/assets/pineapple.png', height: 300,),

          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(19.0, 0, 19.0, 25.0),
            child: Text(
                "The ultimate grocery shopping experience",
                textAlign: TextAlign.center,
                style: GoogleFonts.notoSerif(
                    fontSize: 40, fontWeight: FontWeight.bold)),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(5, 24, 5, 0),
            child: Text(
              "Fresh items everyday",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
          const Spacer(),
          //get started
          GestureDetector(
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) {
                return const MainPage();
              }
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green[800],
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(24),
              child: const Text(
                "Get Started",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  //fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}