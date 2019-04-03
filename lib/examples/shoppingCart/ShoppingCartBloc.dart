import 'dart:async';

import 'package:advanced_flutter_example/examples/shoppingCart/BlockProvider.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

class ShoppingCartBloc implements BlocBase {
  static const String TAG = "ShoppingCartBloc";

  List<String> products = [];

  /// Sinks
  Sink<String> get addition => itemAdditionController.sink;
  final itemAdditionController = StreamController<String>();

  /// Sinks
  Sink<String> get substraction => itemSubtractionController.sink;
  final itemSubtractionController = StreamController<String>();

  /// Streams
  Stream<List<String>> get items => _items.stream;
  final _items = BehaviorSubject<List<String>>();

  ShoppingCartBloc() {
    itemAdditionController.stream.listen(handleItemAdd);
    itemSubtractionController.stream.listen(handleItemRem);
  }

  ///
  /// Logic for item added to shopping cart.
  ///
  void handleItemAdd(String item) {
    Logger(TAG).info("Add item to the shopping cart");

    return;
  }

  ///
  /// Logic for item removed from shopping cart.
  ///
  void handleItemRem(String item) {
    Logger(TAG).info("Remove item from the shopping cart");

    return;
  }

  @override
  void dispose() {}
}
