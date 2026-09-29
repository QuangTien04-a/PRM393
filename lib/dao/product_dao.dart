import '../models/product.dart';

class ProductDAO {
  final List<Product> products = [
    Product(
      id: 'P01',
      name: 'iPhone 15',
      description:
      'Experience the latest technology with the iPhone 15. Stunning design and powerful performance.',
      price: 1099,
      discountPercen: 9,
      image:
      'https://images.unsplash.com/photo-1696446701796-da61225697cc?w=800',
    ),
    Product(
      id: 'P02',
      name: 'Samsung S24',
      description:
      'Samsung Galaxy S24 with a beautiful display, powerful performance and modern design.',
      price: 999,
      discountPercen: 10,
      image:
      'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=800',
    ),
    Product(
      id: 'P03',
      name: 'MacBook Air',
      description:
      'MacBook Air delivers excellent performance with a thin, lightweight and elegant design.',
      price: 1299,
      discountPercen: 7,
      image:
      'https://images.unsplash.com/photo-1517336714739-489689fd1ca8?w=800',
    ),
    Product(
      id: 'P04',
      name: 'AirPods Pro',
      description:
      'AirPods Pro provides immersive sound, active noise cancellation and comfortable wireless listening.',
      price: 249,
      discountPercen: 20,
      image:
      'https://images.unsplash.com/photo-1600294037681-c80b4cb5b434?w=800',
    ),
    Product(
      id: 'P05',
      name: 'iPad Pro',
      description:
      'iPad Pro combines powerful performance with a stunning display for work and entertainment.',
      price: 999,
      discountPercen: 12,
      image:
      'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=800',
    ),
    Product(
      id: 'P06',
      name: 'Apple Watch',
      description:
      'Apple Watch helps you stay connected, track your activity and manage your everyday life.',
      price: 399,
      discountPercen: 15,
      image:
      'https://images.unsplash.com/photo-1551816230-ef5deaed4a26?w=800',
    ),
  ];

  // Get all products
  List<Product> getAllProduct() {
    return products;
  }

  // Find products by name
  List<Product> findProductByName(String name) {
    return products
        .where(
          (product) =>
          product.name.toLowerCase().contains(name.toLowerCase()),
    )
        .toList();
  }
}