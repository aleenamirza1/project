import 'dart:io';

class Product {
  String name;
  double price;

  Product(this.name, this.price);
}

class ShoppingCart {
  List<Product> items = [];

  void addItem(Product product) {
    items.add(product);
  }

  double calculateTotal() {
    double total = 0;
    for (var item in items) {
      total += item.price;
    }
    return total;
  }

  void printReceipt() {
    print("===== Receipt =====");
    for (var item in items) {
      print("${item.name}: \$${item.price}");
    }
    print("===================");
    print("Total: \$${calculateTotal()}");
    print("===================");
  }
}

void main() {
  var apple = Product("Apple", 1.0);
  var banana = Product("Banana", 0.5);
  var milk = Product("Milk", 2.0);

  var cart = ShoppingCart();

  while (true) {
    print("1. Add item to cart");
    print("2. Print receipt");
    print("3. Exit");
    stdout.write("Enter your choice: ");
    var choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        print("Available products:");
        print("1. ${apple.name} (\$${apple.price})");
        print("2. ${banana.name} (\$${banana.price})");
        print("3. ${milk.name} (\$${milk.price})");
        stdout.write("Enter the product number to add to cart: ");
        var productChoice = int.parse(stdin.readLineSync()!);

        switch (productChoice) {
          case 1:
            cart.addItem(apple);
            break;
          case 2:
            cart.addItem(banana);
            break;
          case 3:
            cart.addItem(milk);
            break;
          default:
            print("Invalid product number.");
        }
        break;
      case 2:
        cart.printReceipt();
        break;
      case 3:
        print("Exiting the program. Goodbye!");
        exit(0);
      default:
        print("Invalid choice. Please enter a valid option.");
    }
  }
}
