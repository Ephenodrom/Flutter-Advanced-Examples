class Product {
  final String name;
  final double priceNet;
  final double priceGross;
  final double vatAmount;
  final double tax;

  Product(
      {this.name, this.priceNet, this.priceGross, this.vatAmount, this.tax});
}

List<Product> products = [
  new Product(
      name: "Bread", priceNet: 3.0, priceGross: 2.72, vatAmount: 0.28, tax: 10),
  new Product(
      name: "Tomatos",
      priceNet: 2.0,
      priceGross: 1.81,
      vatAmount: 0.19,
      tax: 10),
  new Product(
      name: "Salad", priceNet: 2.0, priceGross: 1.81, vatAmount: 0.19, tax: 10),
  new Product(
      name: "Butter",
      priceNet: 2.5,
      priceGross: 2.27,
      vatAmount: 0.23,
      tax: 10),
  new Product(
      name: "Milk", priceNet: 0.99, priceGross: 0.9, vatAmount: 0.09, tax: 10),
  new Product(
      name: "Honey",
      priceNet: 5.35,
      priceGross: 4.86,
      vatAmount: 0.49,
      tax: 10),
];
