import 'package:basquet_client/domain/cart/cart.dart';
import 'package:basquet_client/domain/cart/model.dart';
import 'package:basquet_client/ui/cart/cart_item.dart';
import 'package:flutter/material.dart';

class CartListWidget extends StatefulWidget {
  final List<CartItem> cartItems;

  const CartListWidget({Key key, this.cartItems}) : super(key: key);

  @override
  _CartListWidgetState createState() => _CartListWidgetState();
}

class _CartListWidgetState extends State<CartListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.cartItems.length,
      itemBuilder: (context, index) {
        return CartItemWidget(widget.cartItems[index]);
      },
    );
  }
}
