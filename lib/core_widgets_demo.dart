import 'package:flutter/material.dart';

class CoreWidgetsDemo extends StatelessWidget {
  const CoreWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Core Widgets Demo'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Text
            const Text(
              'Flutter UI Fundamentals',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // Icon
            const Icon(
              Icons.flutter_dash,
              size: 60,
              color: Colors.blue,
            ),

            const SizedBox(height: 20),

            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://picsum.photos/800/1000',
                width: double.infinity,
                height: 500,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
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
            // Card + ListTile
            Card(
              elevation: 4,
              child: ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Colors.blue,
                ),

                title: const Text(
                  'Student Information',
                ),

                subtitle: const Text(
                  'This is a ListTile inside a Card.',
                ),

                trailing: const Icon(
                  Icons.arrow_forward,
                ),

                // Khi bấm vào ListTile
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          'Student Information',
                        ),

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