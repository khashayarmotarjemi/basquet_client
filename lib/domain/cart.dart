import 'package:basquet_client/data/cart_repo.dart';
import 'package:basquet_client/domain/product.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

class Cart {
  final BehaviorSubject<CartData> _data = BehaviorSubject();
  final CartRepository _cartRepository = GetIt.I<CartRepository>();

  Cart() {
    _data.add(LoadingCart());
    _cartRepository.getItems().then((result) => {
          if (result == null)
            {_data.add(ErrorLoadingCart())}
          else
            {_data.add(CartLoaded(result))}
        });
  }

  Stream<CartData> data() {
    return _data.stream;
  }

  void dispose() {
    _data.close();
  }
}

class CartData {}

class LoadingCart extends CartData {}

class CartLoaded extends CartData {
  final List<CartItem> items;

  CartLoaded(this.items);
}

class ErrorLoadingCart extends CartData {
  final String error;

  ErrorLoadingCart({this.error = ""});
}

class CartItem {
  final Product product;
  final int count;

  CartItem(this.product, this.count);
}
