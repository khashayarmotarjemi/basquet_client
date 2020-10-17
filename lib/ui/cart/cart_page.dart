import 'package:basquet_client/domain/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'cart_item_list.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final Cart _cart = GetIt.I<Cart>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Container(
          child: StreamBuilder<CartData>(
        stream: _cart.data(),
        builder: (context, snapshot) {
          if (snapshot != null && snapshot.data != null) {
            final cartData = snapshot.data;

            if (cartData is CartLoaded) {
              return Center(
                child: CartListWidget(
                  cartItems: cartData.items,
                ),
              );
            } else if (cartData is LoadingCart) {
              return Container(
                child: Text("Loading"),
              );
            } else {
              return Container();
            }
          } else {
            return Container(
              height: 200,
              width: 200,
              color: Colors.amber,
              child: Text('click me'),
            );
          }
        },
      )),
    );
  }
}
