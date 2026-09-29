import 'package:flutter/material.dart';

class ProductBottomNav extends StatelessWidget {
  final int currentIndex;

  const ProductBottomNav({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,

      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.inventory_2_outlined),
          label: 'Product Detail',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
      ],

      onTap: (index) {
        if (index == currentIndex) {
          return;
        }

        // Home
        if (index == 0) {
          Navigator.popUntil(
            context,
                (route) => route.isFirst,
          );
        }
      },
    );
  }
}