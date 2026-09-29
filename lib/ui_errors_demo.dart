import 'package:flutter/material.dart';

class UiErrorsDemo extends StatefulWidget {
  const UiErrorsDemo({super.key});

  @override
  State<UiErrorsDemo> createState() => _UiErrorsDemoState();
}

class _UiErrorsDemoState extends State<UiErrorsDemo> {
  int counter = 0;
  DateTime? selectedDate;

  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
  ];

  Future<void> selectDate() async {
    // The DatePicker is called from the State's valid BuildContext.
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exercise 5 - Fix UI Errors',
        ),
      ),

      body: SingleChildScrollView(
        // Fix overflow on small screens.
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Common UI Error Fixes',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              '1. ListView inside Column',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            // Expanded is normally used when ListView is directly
            // inside a Column with a fixed available height.
            Container(
              height: 220,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'ListView has a limited height',
                    ),
                  ),

                  Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(Icons.check),
                          title: Text(items[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              '2. SingleChildScrollView',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'SingleChildScrollView allows the content '
                  'to scroll when the screen is too small.',
            ),

            const SizedBox(height: 24),

            const Text(
              '3. State Update with setState()',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Counter: $counter',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: () {
                // setState rebuilds the UI after changing state.
                setState(() {
                  counter++;
                });
              },
              child: const Text('Increase Counter'),
            ),

            const SizedBox(height: 24),

            const Text(
              '4. DatePicker Context',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: selectDate,
              child: const Text('Open DatePicker'),
            ),

            const SizedBox(height: 8),

            Text(
              selectedDate == null
                  ? 'No date selected'
                  : 'Selected date: '
                  '${selectedDate!.day}/'
                  '${selectedDate!.month}/'
                  '${selectedDate!.year}',
            ),
          ],
        ),
      ),
    );
  }
}