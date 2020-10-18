import 'package:basquet_client/domain/cart/bloc.dart';
import 'package:basquet_client/domain/cart/model.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatefulWidget {
  final CartItem cartItem;

  CartItemWidget(this.cartItem);

  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(child: Column(
        children: [
          Text(widget.cartItem.product.name),
          Text(widget.cartItem.quantity.toString())
        ],
      ),padding: EdgeInsets.symmetric(vertical: 50,horizontal: 30),),
    );
  }
}
