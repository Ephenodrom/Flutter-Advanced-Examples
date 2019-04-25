import 'package:advanced_flutter_example/DefaultAppBar.dart';
import 'package:advanced_flutter_example/basic/BlocProvider.dart';
import 'package:advanced_flutter_example/examples/shoppingCart/Example5.dart';
import 'package:advanced_flutter_example/basic/GlobalBloc.dart';
import 'package:advanced_flutter_example/examples/shoppingCart/Product.dart';
import 'package:advanced_flutter_example/examples/shoppingCart/ShoppingCart.dart';
import 'package:flutter/material.dart';

class ShoppingCartScreen extends StatefulWidget {
  ShoppingCartScreen();

  final String title = "Shopping Cart";
  final String exampleUrl =
      "https://github.com/Ephenodrom/FlutterAdvancedExamples/tree/master/lib/examples/shoppingCart";

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCartScreen> {
  ShoppingCart cart;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(widget.title, widget.exampleUrl),
        body: StreamBuilder(
            stream: BlocProvider.of<GlobalBloc>(context)
                .shoppingCartBloc
                .cartStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: Text("Shopping cart is empty"));
              } else {
                cart = snapshot.data;
                if (cart.products.length == 0) {
                  return Center(child: Text("Shopping cart is empty"));
                }
                return Container(
                    padding: EdgeInsets.all(16),
                    child: Column(children: [
                      Expanded(
                        child: ListView(
                          children: <Widget>[
                            Card(
                              child: ListTile(
                                leading: Text("Total - Gross",
                                    style: Theme.of(context).textTheme.subhead),
                                trailing: Text(cart.priceNet.toString() + " €",
                                    style:
                                        Theme.of(context).textTheme.headline),
                              ),
                            ),
                            Card(
                              child: ExpansionTile(
                                  title: Text("Products (" +
                                      cart.products.length.toString() +
                                      ")"),
                                  children: getProductTiles()),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            child: Text("Order now!"),
                            onPressed: () {
                              BlocProvider.of<GlobalBloc>(context)
                                  .shoppingCartBloc
                                  .clearCart();
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text("Order completed!")));
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Example5()),
                              );
                            },
                          ),
                        ),
                      )
                    ]));
              }
            }));
  }

  List<Widget> getProductTiles() {
    List<Widget> list = [];
    if (cart != null) {
      for (Product p in cart.products) {
        String name = p.name;
        String price = p.priceNet.toString();
        list.add(ListTile(
          title: Text(name),
          subtitle: Text(price + " €"),
          trailing: FlatButton(
            padding: EdgeInsets.only(left: 0, right: 0),
            child: Icon(Icons.clear, color: Colors.red),
            onPressed: () {
              BlocProvider.of<GlobalBloc>(context)
                  .shoppingCartBloc
                  .substraction
                  .add(p);
            },
          ),
        ));
      }
    }
    return list;
  }
}
