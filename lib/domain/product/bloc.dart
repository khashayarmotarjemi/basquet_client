import 'package:basquet_client/data/cart_repo.dart';
import 'package:basquet_client/data/product_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

import 'model.dart';

class ProductsBloc {
  final BehaviorSubject<ProductData> _data = BehaviorSubject();
  final ProductsRepository _productRepository = GetIt.I<ProductsRepository>();

  ProductsBloc() {
    _data.add(LoadingProducts());
    _productRepository.getItems().then((result) => {
          if (result == null)
            {_data.add(ErrorLoadingProducts())}
          else
            {_data.add(ProductsLoaded(result))}
        });
  }

  Stream<ProductData> data() {
    return _data.stream;
  }

  void dispose() {
    _data.close();
  }
}

// states
class ProductData {}

class LoadingProducts extends ProductData {}

class ProductsLoaded extends ProductData {
  final List<Product> products;

  ProductsLoaded(this.products);
}

class ErrorLoadingProducts extends ProductData {
  final String error;

  ErrorLoadingProducts({this.error = ""});
}
