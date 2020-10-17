import 'package:basquet_client/data/cart_repo.dart';
import 'package:basquet_client/data/netclient.dart';
import 'package:basquet_client/ui/cart/cart_page.dart';
import 'package:basquet_client/ui/product/products_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'domain/cart/cart.dart';

void main() {

  // the order should be correct here

  final Net _net = Net();
  GetIt.I.registerSingleton(_net);

  final CartRepository _cartRepository = CartRepository();
  GetIt.I.registerSingleton(_cartRepository);

  final Cart _cart = Cart();
  GetIt.I.registerSingleton(_cart);

  ///////////////////////////////////


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CartPage(),
    );
  }
}
