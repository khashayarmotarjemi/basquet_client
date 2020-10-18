import 'dart:convert';

import 'package:basquet_client/domain/cart/bloc.dart';
import 'package:basquet_client/domain/cart/model.dart';
import 'package:basquet_client/domain/product/model.dart';
import 'package:get_it/get_it.dart';

import 'netclient.dart';

class CartRepository {
  final net = GetIt.I<Net>();

  Future<List<CartItem>> getItems() async {
    final res =
        await net.dispatch(EndPoint.GET_CART_DATA, params: {"user_id": 1});
    if (res is SuccessResponse) {
      final list = List<Map<String, dynamic>>.from(json.decode(res.data));
      final items =
          list.map((itemJson) => CartItem.fromJson(itemJson)).toList();
      return items;
    } else {
      return null;
    }
  }

  Future<bool> add(Product product) async {
    final res = await net.dispatch(EndPoint.ADD_TO_CART,
        params: {"user_id": 1, "product_id": product.id.toString()});
    return res is SuccessResponse;
  }
}
