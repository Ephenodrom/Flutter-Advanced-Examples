import 'package:advanced_flutter_example/examples/shoppingCart/BlockProvider.dart';
import 'package:advanced_flutter_example/examples/shoppingCart/ShoppingCartBloc.dart';

class GlobalBloc implements BlocBase {
  ShoppingCartBloc shoppingCartBloc;

  GlobalBloc() {
    shoppingCartBloc = ShoppingCartBloc();
  }

  void dispose() {
    shoppingCartBloc.dispose();
  }
}
