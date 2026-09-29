import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  final List<String> movies = const [
    'Avengers: Endgame',
    'Spider-Man: No Way Home',
    'Interstellar',
    'The Dark Knight',
    'Inception',
    'The Matrix',
    'Iron Man',
    'Doctor Strange',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 3 - Layout Basics'),
      ),
      body: Column(
        children: [
          // Padding creates consistent space around the header.
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Movie Home',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                // Row creates a horizontal section.
                Row(
                  children: [
                    const Icon(Icons.movie),
                    const SizedBox(width: 8),
                    Text(
                      'Popular Movies',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Expanded allows ListView to use the remaining space.
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text(movies[index]),
                      subtitle: const Text(
                        'Movie item',
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}