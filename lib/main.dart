import 'package:flutter/material.dart';
import 'core_widgets_demo.dart';

void main() {
  runApp(const Lab4App());
}

class Lab4App extends StatelessWidget {
  const Lab4App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 4',
      home: const ExerciseMenu(),
    );
  }
}

class ExerciseMenu extends StatelessWidget {
  const ExerciseMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 4 - Flutter UI Fundamentals'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Select Exercise',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          // Exercise 1 - Bấm được
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CoreWidgetsDemo(),
                ),
              );
            },
            child: const Text(
              'Exercise 1 - Core Widgets',
            ),
          ),

          const SizedBox(height: 12),

          // Exercise 2 - Chưa làm
          const ElevatedButton(
            onPressed: null,
            child: Text(
              'Exercise 2 - Input Widgets',
            ),
          ),

          const SizedBox(height: 12),

          // Exercise 3 - Chưa làm
          const ElevatedButton(
            onPressed: null,
            child: Text(
              'Exercise 3 - Layout Composition',
            ),
          ),

          const SizedBox(height: 12),

          // Exercise 4 - Chưa làm
          const ElevatedButton(
            onPressed: null,
            child: Text(
              'Exercise 4 - Scaffold',
            ),
          ),

          const SizedBox(height: 12),

          // Exercise 5 - Chưa làm
          const ElevatedButton(
            onPressed: null,
            child: Text(
              'Exercise 5 - ThemeData',
            ),
          ),
        ],
      ),
    );
  }
}