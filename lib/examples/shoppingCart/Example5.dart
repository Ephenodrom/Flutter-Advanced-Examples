import 'package:advanced_flutter_example/DefaultAppBar.dart';
import 'package:advanced_flutter_example/basic/BlocProvider.dart';
import 'package:advanced_flutter_example/basic/GlobalBloc.dart';
import 'package:advanced_flutter_example/examples/shoppingCart/Product.dart';
import 'package:advanced_flutter_example/examples/shoppingCart/ShoppingCartAppBarIcon.dart';
import 'package:flutter/material.dart';

class Example5 extends StatefulWidget {
  Example5();

  final String title = "Shopping Cart";
  final String exampleUrl =
      "https://github.com/Ephenodrom/FlutterAdvancedExamples/tree/master/lib/examples/shoppingCart";

  @override
  _Example5State createState() => _Example5State();
}

class _Example5State extends State<Example5> {
  List<Product> productList = products;

  @override
  Widget build(BuildContext context) {
    List<Widget> actions = [];
    actions.add(ShoppingCartAppBarIcon());
    return Scaffold(
        appBar: DefaultAppBar(
          widget.title,
          widget.exampleUrl,
          customActions: actions,
        ),
        body: ListView.builder(
            itemCount: productList.length,
            itemBuilder: (BuildContext context, index) {
              return ListTile(
                title: Text(products.elementAt(index).name),
                subtitle: Text(
                    productList.elementAt(index).priceNet.toString() + " €"),
                trailing: Icon(Icons.add_shopping_cart),
                onTap: () {
                  BlocProvider.of<GlobalBloc>(context)
                      .shoppingCartBloc
                      .addition
                      .add(productList.elementAt(index));
                },
              );
            }));
  }
}
