import 'package:basquet_client/data/cart_repo.dart';
import 'package:basquet_client/data/netclient.dart';
import 'package:basquet_client/data/product_repo.dart';
import 'package:basquet_client/domain/product/bloc.dart';
import 'package:basquet_client/ui/cart/page.dart';
import 'package:basquet_client/ui/product/page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'domain/cart/bloc.dart';

void main() {
  // the order should be correct here

  final Net _net = Net();
  GetIt.I.registerSingleton(_net);

  final CartRepository _cartRepository = CartRepository();
  GetIt.I.registerSingleton(_cartRepository);

  final CartBloc _cart = CartBloc();
  GetIt.I.registerSingleton(_cart);

  final ProductsRepository _productsRepository = ProductsRepository();
  GetIt.I.registerSingleton(_productsRepository);

  final ProductsBloc _productsBloc = ProductsBloc();
  GetIt.I.registerSingleton(_productsBloc);

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
      home: ProductsPage(),
    );
  }
}
