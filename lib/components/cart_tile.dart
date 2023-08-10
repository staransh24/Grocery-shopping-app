import'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
  // list of items uploaded
  final List _shopItems = [
    // [itemName, itemPrice, imagePath, color]
    ["Banana", "60.00", "lib/assets/banana2.png", Colors.yellow],
    ["Cabbage", "20.00", "lib/assets/cabbage.png", Colors.green],
    ["Carrot", "90.00", "lib/assets/carrot.png", Colors.orange],
    ["Onion", "40.00", "lib/assets/onion.png", Colors.purpleAccent]
  ];
  final List _cartItems =  [];

  List get shopItems => _shopItems;

  List get cartItems => _cartItems;

  //add items to cart
  void addItemToCart(int index){
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  //remove items form cart
  void removeItems(int index){
    _cartItems.removeAt((index));
    notifyListeners();
  }

  String calculateTotal(){
    double totalPrice = 0;
    for(int i=0; i<_cartItems.length; i++){
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}