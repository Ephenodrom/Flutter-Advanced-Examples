import 'dart:async';

import 'package:advanced_flutter_example/basic/BlocProvider.dart';
import 'package:advanced_flutter_example/examples/shoppingCart/Product.dart';
import 'package:advanced_flutter_example/examples/shoppingCart/ShoppingCart.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

class ShoppingCartBloc implements BlocBase {
  static const String TAG = "ShoppingCartBloc";

  ShoppingCart cart = ShoppingCart();

  /// Sinks
  Sink<Product> get addition => itemAdditionController.sink;
  final itemAdditionController = StreamController<Product>();

  Sink<Product> get substraction => itemSubtractionController.sink;
  final itemSubtractionController = StreamController<Product>();

  /// Streams
  Stream<ShoppingCart> get cartStream => _cart.stream;
  final _cart = BehaviorSubject<ShoppingCart>();

  ShoppingCartBloc() {
    itemAdditionController.stream.listen(handleItemAdd);
    itemSubtractionController.stream.listen(handleItemRem);
  }

  ///
  /// Logic for product added to shopping cart.
  ///
  void handleItemAdd(Product item) {
    Logger(TAG).info("Add product to the shopping cart");
    cart.addProduct(item);
    cart.calculate();
    _cart.add(cart);
    return;
  }

  ///
  /// Logic for product removed from shopping cart.
  ///
  void handleItemRem(Product item) {
    Logger(TAG).info("Remove product from the shopping cart");
    cart.remProduct(item);
    cart.calculate();
    _cart.add(cart);
    return;
  }

  ///
  /// Clears the shopping cart
  ///
  void clearCart() {
    cart.clear();
  }

  @override
  void dispose() {
    itemAdditionController.close();
    itemSubtractionController.close();
  }
}
