import 'package:flutter/material.dart';

import '../dao/product_dao.dart';
import '../models/product.dart';
import '../widgets/bottom_nav.dart';
import 'product_detail_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({
    super.key,
  });

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductDAO productDAO = ProductDAO();

  List<Product> products = [];

  @override
  void initState() {
    super.initState();

    products = productDAO.getAllProduct();
  }

  void searchProduct(String value) {
    setState(() {
      if (value.trim().isEmpty) {
        products = productDAO.getAllProduct();
      } else {
        products = productDAO.findProductByName(value);
      }
    });
  }

  int getColumnCount(
      double width,
      Orientation orientation,
      ) {
    // Width <= 500
    if (width <= 500) {
      // Portrait -> 1 column
      if (orientation == Orientation.portrait) {
        return 1;
      }

      // Landscape -> 2 columns
      return 2;
    }

    // Width > 500
    // Portrait -> 2 columns
    if (orientation == Orientation.portrait) {
      return 2;
    }

    // Landscape -> 3 columns
    return 3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Products',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [
          // Search box
          Padding(
            padding: const EdgeInsets.fromLTRB(
              16,
              12,
              16,
              8,
            ),
            child: TextField(
              onChanged: searchProduct,
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: const Icon(
                  Icons.search,
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Product grid
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final double width = constraints.maxWidth;

                final Orientation orientation =
                    MediaQuery.of(context).orientation;

                final int columnCount = getColumnCount(
                  width,
                  orientation,
                );

                if (products.isEmpty) {
                  return const Center(
                    child: Text(
                      'No products found',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  );
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(16),

                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columnCount,

                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,

                    // Automatically adjusts item size
                    // according to parent width.
                    childAspectRatio:
                    columnCount == 1 ? 1.15 : 0.72,
                  ),

                  itemCount: products.length,

                  itemBuilder: (context, index) {
                    final Product product = products[index];

                    return ProductCard(
                      product: product,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: const ProductBottomNav(
        currentIndex: 0,
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),

      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ProductDetailScreen(
                  product: product,
                );
              },
            ),
          );
        },

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.grey.shade100,
                child: Image.network(
                  product.image,
                  fit: BoxFit.contain,
                  errorBuilder: (
                      context,
                      error,
                      stackTrace,
                      ) {
                    return const Center(
                      child: Icon(
                        Icons.image_not_supported,
                        size: 55,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
            ),

            // Information
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  // Product name
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  // Price
                  Row(
                    children: [
                      Text(
                        '\$${product.price.toStringAsFixed(0)}',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          decoration:
                          TextDecoration.lineThrough,
                        ),
                      ),

                      const SizedBox(width: 8),

                      Text(
                        '\$${product.salePrice.toStringAsFixed(0)}',
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  // Discount
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius:
                        BorderRadius.circular(5),
                      ),
                      child: Text(
                        '-${product.discountPercen.toStringAsFixed(0)}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}