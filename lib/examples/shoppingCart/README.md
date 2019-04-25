# Shopping Cart

## Description

Managing a shopping cart system with BLOC logic using the rxdart package.

## Structure

First of all activate the [GlobalBloc](../../basic/GlobalBloc.dart) with [BlocProvider](../../basic/BlocProvider.dart) in the [main](../../main.dart) file.

```dart
@override
Widget build(BuildContext context) {
    return BlocProvider<GlobalBloc>(
        bloc: GlobalBloc(),
        child: MaterialApp(
          title: 'Flutter Advanced Example',
          home: Home(title: 'Flutter Advanced Examples'),
        )
    );
}
```

The example has two widgets that represents the shopping cart :

* ShoppingCartAppBarIcon
* ShoppingCartScreen

The ShoppingCartAppBarIcon displays the amount of [products](Product.dart) in the shopping cart.

```dart
StreamBuilder(
    stream: BlocProvider.of<GlobalBloc>(context).shoppingCartBloc.cartStream,
    initialData: ShoppingCart(),
    builder: (context, snapshot) {
        int count = 0;
        if (snapshot.hasData) {
            if (snapshot.data is ShoppingCart) {
              count = snapshot.data.products.length;
            }
        }
        return Chip(
            label: Text(count.toString()),
            backgroundColor: Colors.transparent,
            avatar: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).primaryColor,
            ),
        );
    },
),
```

It also links to the [ShoppingCartScreen](ShoppingCartScreen.dart).

```dart
onPressed: () {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ShoppingCartScreen()),
    );
}
```

The widget [Example5](Example5.dart) displays a list of products. Each product can be added to the shopping cart.

```dart
onTap: () {
    BlocProvider.of<GlobalBloc>(context)
        .shoppingCartBloc
        .addition
        .add(productList.elementAt(index));
}
```

The [ShoppingCartBloc](ShoppingCartBloc.dart) handles adding and removing items to the cart.
We have a sink for adding and removing items.

```dart
/// Sinks
Sink<Product> get addition => itemAdditionController.sink;
final itemAdditionController = StreamController<Product>();

Sink<Product> get substraction => itemSubtractionController.sink;
final itemSubtractionController = StreamController<Product>();

ShoppingCartBloc() {
    itemAdditionController.stream.listen(handleItemAdd);
    itemSubtractionController.stream.listen(handleItemRem);
}
```

We have two methods that will be called when an item is pushed into the sink. We add or remove the [Product](Product.dart) from the [ShoppingCart](ShoppingCart.dart). After recalculating, the cart is added to the stream.

```dart
void handleItemAdd(Product item) {
    Logger(TAG).info("Add product to the shopping cart");
    cart.addProduct(item);
    cart.calculate();
    _cart.add(cart);
}

void handleItemRem(Product item) {
    Logger(TAG).info("Remove product from the shopping cart");
    cart.remProduct(item);
    cart.calculate();
    _cart.add(cart);
}
```
