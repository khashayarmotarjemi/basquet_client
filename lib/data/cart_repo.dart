import 'dart:convert';

import 'package:basquet_client/domain/cart/cart.dart';
import 'package:basquet_client/domain/cart/model.dart';
import 'package:basquet_client/domain/product/product.dart';
import 'package:get_it/get_it.dart';

import 'netclient.dart';

class CartRepository {
  final net = GetIt.I<Net>();
  final List<CartItem> products = [];

  Future<List<CartItem>> getItems() async {
    final res =
        await net.dispatch(EndPoint.GET_CART_DATA, params: {"user_id": 1});
    if (res is SuccessResponse) {
      print(res.data);
      final list = List<Map<String, dynamic>>.from(json.decode(res.data));
      final items =
          list.map((itemJson) => CartItem.fromJson(itemJson)).toList();
      return items;
    } else {
      return null;
    }
  }

  Future<bool> add(Product product) {
    products.add(CartItem(product, 1));
    return Future(() => true);
  }
}
