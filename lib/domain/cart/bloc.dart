import 'package:basquet_client/data/cart_repo.dart';
import 'package:basquet_client/data/netclient.dart';
import 'package:basquet_client/domain/product/model.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

import 'model.dart';

class CartBloc {
  final BehaviorSubject<CartData> _data = BehaviorSubject();
  final CartRepository _cartRepository = GetIt.I<CartRepository>();

  CartBloc() {
    _reloadCart();
  }

  void _reloadCart() {
    _data.add(LoadingCart());
    _cartRepository.getItems().then((result) => {
          if (result == null)
            {_data.add(ErrorLoadingCart())}
          else
            {_data.add(CartLoaded(result))}
        });
  }

  // events
  Stream<CartData> data() {
    return _data.stream;
  }

  void add(Product product) async {
    var res = await _cartRepository.add(product);
    if (res is SuccessResponse) {
      _reloadCart();
    }
  }

  void dispose() {
    _data.close();
  }
}

// states
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
