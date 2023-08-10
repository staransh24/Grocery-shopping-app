import 'package:first_time/components/grocery_item_tile.dart';
import 'package:first_time/components/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white70, forceMaterialTransparency: true),
      //Add back icon or exit icon with pop navigator, also recheck appbar appearance
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const CartPage();
          },
        )),
        backgroundColor: Colors.black,
        child: const Icon(Icons.shopping_bag),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(height: 48),
            //Good Morning
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Text("Good Morning,"),
            ),
            //Lets order fresh items for you
            const SizedBox(height: 0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("Let's order fresh items for you",
                  style: GoogleFonts.notoSerif(
                      fontSize: 33, fontWeight: FontWeight.bold)),
            ),

            //divider
            const Divider(height: 50),
            //const SizedBox(height: 0),
            //grid of items
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Text("Fresh Items: ",
                    style: GoogleFonts.notoSans(
                        fontSize: 15, fontWeight: FontWeight.w400))),
            const Divider(height: 15),
            //Grid of items
            Expanded(child: Consumer<CartModel>(
              builder: (context, value, child) {
                return GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  itemCount: value.shopItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                  itemBuilder: (context, index) {
                    return GroceryItemTile(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      imagePath: value.shopItems[index][2],
                      color: value.shopItems[index][3],
                      onPressed: () {
                        Provider.of<CartModel>(context, listen: false)
                            .addItemToCart(index);
                      },
                    );
                  },
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
