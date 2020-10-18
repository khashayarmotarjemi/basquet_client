import 'package:basquet_client/domain/product/model.dart';
import 'package:flutter/material.dart';

import 'list_item.dart';

class ProductsListWidget extends StatefulWidget {
  final List<Product> products;

  const ProductsListWidget({Key key, this.products}) : super(key: key);

  @override
  _ProductsListWidgetState createState() => _ProductsListWidgetState();
}

class _ProductsListWidgetState extends State<ProductsListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.products.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return ProductWidget(widget.products[index]);
      },
    );
  }
}
