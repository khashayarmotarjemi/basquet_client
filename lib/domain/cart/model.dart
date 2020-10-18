import 'package:basquet_client/domain/product/model.dart';

class CartItem {
  final Product product;
  final int quantity;

  CartItem(this.product, this.quantity);

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(Product.fromJson(json["product"]), json["quantity"]);
  }
}
