import 'package:basquet_client/domain/cart/cart.dart';
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
      child: Column(
        children: [
          Text(widget.cartItem.product.name),
          Text(widget.cartItem.quantity.toString())
        ],
      ),
    );
  }
}
