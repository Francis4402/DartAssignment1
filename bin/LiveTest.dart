void main() {

  List<Map<String, dynamic>> fruits = [
    {'name': 'Apple', 'color': 'Red', 'price': 2.5},
    {'name': 'Banana', 'color': 'Yellow', 'price': 1.0},
    {'name': 'Orange', 'color': 'Orange', 'price': 3.0},
  ];


  displayFruitDetails(fruits);


  applyPriceDiscount(fruits, 10);


  print('\nFruit Details After Applying 10% Discount:');
  displayFruitDetails(fruits);
}


void displayFruitDetails(List<Map<String, dynamic>> fruits) {
  print('Original Fruit Details before Discount:');
  for (var fruit in fruits) {
    print('Name: ${fruit['name']}, Color: ${fruit['color']}, Price: \$${fruit['price']}');
  }
}


void applyPriceDiscount(List<Map<String, dynamic>> fruits, double discountPercentage) {

  if (discountPercentage < 0 || discountPercentage > 100) {
    print('Invalid discount percentage. It should be between 0 and 100.');
    return;
  }

  for (var fruit in fruits) {
    double originalPrice = fruit['price'];
    double discountedPrice = originalPrice - (originalPrice * discountPercentage / 100);
    fruit['price'] = discountedPrice;
  }
}
