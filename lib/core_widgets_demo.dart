import 'package:flutter/material.dart';

class CoreWidgetsDemo extends StatelessWidget {
  const CoreWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 1 - Core Widgets'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text widget
            const Text(
              'Flutter UI Fundamentals',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            // Icon widget
            const Icon(
              Icons.flutter_dash,
              size: 70,
              color: Colors.blue,
            ),

            const SizedBox(height: 24),

            // Image.network widget
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://picsum.photos/800/1000',
                width: double.infinity,
                height: 500,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 500,
                    alignment: Alignment.center,
                    color: Colors.grey.shade200,
                    child: const Icon(
                      Icons.image_not_supported,
                      size: 80,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // Card containing a ListTile
            Card(
              elevation: 4,
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: const Icon(
                  Icons.person,
                  color: Colors.blue,
                  size: 32,
                ),
                title: const Text(
                  'Student Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'This is a ListTile inside a Card.',
                ),
                trailing: const Icon(
                  Icons.arrow_forward,
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Student Information'),
                        content: const Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name: Tien'),
                            SizedBox(height: 8),
                            Text(
                              'Major: Bridge System Engineer',
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Course: Flutter UI Fundamentals',
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}