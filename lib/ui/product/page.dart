import 'package:basquet_client/domain/product/bloc.dart';
import 'package:basquet_client/ui/product/list.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final _productBloc = GetIt.I<ProductsBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("products"),
      ),
      body: Container(
          child: StreamBuilder<ProductData>(
        stream: _productBloc.data(),
        builder: (context, snapshot) {
          if (snapshot != null && snapshot.data != null) {
            final productsData = snapshot.data;

            if (productsData is ProductsLoaded) {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 200),
                child: ProductsListWidget(products: productsData.products),
              );
            } else if (productsData is LoadingProducts) {
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
