import 'package:advanced_flutter_example/examples/shoppingCart/Product.dart';

class ShoppingCart {
  List<Product> products = [];
  double priceNet;
  double priceGross;
  double vatAmount;

  void addProduct(Product p) {
    products.add(p);
  }

  void remProduct(Product p) {
    products.remove(p);
  }

  void calculate() {
    priceNet = 0;
    priceGross = 0;
    vatAmount = 0;
    products.forEach((p) {
      priceNet += p.priceNet;
      priceGross += p.priceGross;
      vatAmount += p.vatAmount;
    });
  }

  void clear() {
    products = [];
    priceNet = 0;
    priceGross = 0;
    vatAmount = 0;
  }
}
