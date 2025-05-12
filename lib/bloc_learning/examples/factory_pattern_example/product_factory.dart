// Factory Pattern Example

// Product interface
abstract class Product {
  String getName();
  double getPrice();
}

// Concrete Product implementations
class ElectronicProduct implements Product {
  final String name;
  final double price;
  
  ElectronicProduct(this.name, this.price);
  
  @override
  String getName() => name;
  
  @override
  double getPrice() => price;
}

class ClothingProduct implements Product {
  final String name;
  final double price;
  
  ClothingProduct(this.name, this.price);
  
  @override
  String getName() => name;
  
  @override
  double getPrice() => price;
}

class FoodProduct implements Product {
  final String name;
  final double price;
  
  FoodProduct(this.name, this.price);
  
  @override
  String getName() => name;
  
  @override
  double getPrice() => price;
}

// Product Factory
class ProductFactory {
  // Factory method to create products based on type
  static Product createProduct(String type, String name, double price) {
    switch (type.toLowerCase()) {
      case 'electronic':
        return ElectronicProduct(name, price);
      case 'clothing':
        return ClothingProduct(name, price);
      case 'food':
        return FoodProduct(name, price);
      default:
        throw Exception('Invalid product type: $type');
    }
  }
}