import 'dart:convert';

import 'package:basquet_client/domain/cart/bloc.dart';
import 'package:basquet_client/domain/cart/model.dart';
import 'package:basquet_client/domain/product/model.dart';
import 'package:get_it/get_it.dart';

import 'netclient.dart';

class ProductsRepository {
  final net = GetIt.I<Net>();
  final List<CartItem> products = [];

  Future<List<Product>> getItems() async {
    final res =
    await net.dispatch(EndPoint.GET_PRODUCTS, params: {});
    if (res is SuccessResponse) {
      final list = List<Map<String, dynamic>>.from(json.decode(res.data));
      final products =
      list.map((pJson) => Product.fromJson(pJson)).toList();
      return products;
    } else {
      return null;
    }
  }
}
