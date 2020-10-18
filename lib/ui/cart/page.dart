import 'package:basquet_client/domain/cart/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'list.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc _cart = GetIt.I<CartBloc>();

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
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 200),
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
