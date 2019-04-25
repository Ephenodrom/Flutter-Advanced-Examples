import 'package:advanced_flutter_example/basic/BlocProvider.dart';
import 'package:advanced_flutter_example/examples/globalMessage/MessageBloc.dart';
import 'package:advanced_flutter_example/examples/shoppingCart/ShoppingCartBloc.dart';

class GlobalBloc implements BlocBase {
  ShoppingCartBloc shoppingCartBloc;
  MessageBloc messageBloc;

  GlobalBloc() {
    shoppingCartBloc = ShoppingCartBloc();
    messageBloc = MessageBloc();
  }

  void dispose() {
    shoppingCartBloc.dispose();
    messageBloc.dispose();
  }
}
