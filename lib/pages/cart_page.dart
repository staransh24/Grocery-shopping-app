import 'package:first_time/components/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Cart'),
          backgroundColor: Colors.black,
        ),
        body: Consumer<CartModel>(
          builder: (context, value, child) {
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ListView.builder(
                      itemCount: value.cartItems.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.withOpacity(0.3)),
                            child: ListTile(
                                trailing: IconButton(
                                  onPressed: () => Provider.of<CartModel>(context,
                                          listen: false)
                                      .removeItems(index),
                                  icon: const Icon(Icons.cancel_sharp),
                                ),
                                subtitle:
                                    Text('\Rs.' + value.cartItems[index][1]),
                                leading: Image.asset(value.cartItems[index][2],
                                    height: 50),
                                title: Text(value.cartItems[index][0])),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(36),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(28.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Text(
                                      'Total Cost:',
                                      style: TextStyle(color: Colors.white60),
                                    ),
                                  ),
                                  Text('\Rs.' + value.calculateTotal(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ]),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white,width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Row(children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Pay Now', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                ),
                                Icon(Icons.arrow_forward_ios_sharp, color: Colors.white,)
                              ]),
                            ),
                          )
                        ]),
                  ),
                )
              ],
            );
          },
        ));
  }
}
