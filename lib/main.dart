import 'models/product.dart';

void main() {
  // 1. Tạo Product bằng Constructor
  Product product = Product(
    id: 1,
    name: 'Apple',
    quantity: 10,
    price: 25000,
    image: 'apple.jpg',
    description: 'Fresh apple',
  );

  print('===== PRODUCT =====');
  print('ID: ${product.id}');
  print('Name: ${product.name}');
  print('Quantity: ${product.quantity}');
  print('Price: ${product.price}');
  print('Image: ${product.image}');
  print('Description: ${product.description}');

  // 2. Test toJson
  print('\n===== TO JSON =====');
  print(product.toJson());

  // 3. Test fromJson
  Map<String, dynamic> json = {
    'id': 2,
    'name': 'Orange',
    'quantity': 20,
    'price': 30000,
    'image': 'orange.jpg',
    'description': 'Fresh orange',
  };

  Product productFromJson = Product.fromJson(json);

  print('\n===== FROM JSON =====');
  print('ID: ${productFromJson.id}');
  print('Name: ${productFromJson.name}');
  print('Quantity: ${productFromJson.quantity}');
  print('Price: ${productFromJson.price}');

  // 4. Test copyTo
  Product productCopy = product.copyTo(
    name: 'Banana',
    price: 15000,
    quantity: 30,
  );

  print('\n===== COPY TO =====');
  print('ID: ${productCopy.id}');
  print('Name: ${productCopy.name}');
  print('Quantity: ${productCopy.quantity}');
  print('Price: ${productCopy.price}');
}