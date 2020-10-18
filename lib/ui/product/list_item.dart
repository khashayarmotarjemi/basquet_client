import 'package:basquet_client/domain/cart/bloc.dart';
import 'package:basquet_client/domain/cart/model.dart';
import 'package:basquet_client/domain/product/bloc.dart';
import 'package:basquet_client/domain/product/model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ProductWidget extends StatefulWidget {
  final Product _product;

  ProductWidget(this._product);

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: [
            Text(widget._product.name),
            Text(widget._product.price.amount.toString()),
            GestureDetector(
              child: Text("add to cart"),
              onTap: () {
                GetIt.I<CartBloc>().add(widget._product);
              },
            )
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
      ),
    );
  }
}
