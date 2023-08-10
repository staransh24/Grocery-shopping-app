import 'package:first_time/components/cart_tile.dart';
import 'package:first_time/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        ),
    );
  }
}
