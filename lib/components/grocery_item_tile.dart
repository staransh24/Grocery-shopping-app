import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final Color color;
  void Function()? onPressed;

  GroceryItemTile(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.imagePath,
      required this.color,
      required this.onPressed,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: color.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset(imagePath,
                  height: 95,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(itemName,
                  style: GoogleFonts.notoSerif(
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  )
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(2.0),
              child: MaterialButton(
                onPressed: onPressed,
                textColor: Colors.white ,
                colorBrightness: Brightness.dark,
                color: color.withOpacity(0.7),
                child: Text(
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    "Rs.$itemPrice"
                ),
              ),
            )
          ],
        ),
      )

    );
  }
}
