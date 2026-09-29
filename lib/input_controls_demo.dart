import 'package:flutter/material.dart';

class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() => _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo> {
  double sliderValue = 50;
  bool isEnabled = false;
  String selectedRole = 'Student';
  DateTime? selectedDate;

  Future<void> pickDate() async {
    // DatePicker is called from a valid widget context.
    final DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
    );

    if (date != null) {
      // setState updates the UI after selecting a date.
      setState(() {
        selectedDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 2 - Input Widgets'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Slider',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            Slider(
              value: sliderValue,
              min: 0,
              max: 100,
              divisions: 100,
              label: sliderValue.round().toString(),
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              },
            ),

            Text(
              'Slider value: ${sliderValue.round()}',
            ),

            const SizedBox(height: 24),

            const Text(
              'Switch',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SwitchListTile(
              title: const Text('Enable notifications'),
              value: isEnabled,
              onChanged: (value) {
                setState(() {
                  isEnabled = value;
                });
              },
            ),

            Text(
              'Switch: ${isEnabled ? "ON" : "OFF"}',
            ),

            const SizedBox(height: 24),

            const Text(
              'RadioListTile',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            RadioListTile<String>(
              title: const Text('Student'),
              value: 'Student',
              groupValue: selectedRole,
              onChanged: (value) {
                setState(() {
                  selectedRole = value!;
                });
              },
            ),

            RadioListTile<String>(
              title: const Text('Teacher'),
              value: 'Teacher',
              groupValue: selectedRole,
              onChanged: (value) {
                setState(() {
                  selectedRole = value!;
                });
              },
            ),

            RadioListTile<String>(
              title: const Text('Admin'),
              value: 'Admin',
              groupValue: selectedRole,
              onChanged: (value) {
                setState(() {
                  selectedRole = value!;
                });
              },
            ),

            Text(
              'Selected role: $selectedRole',
            ),

            const SizedBox(height: 24),

            const Text(
              'DatePicker',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: pickDate,
              child: const Text('Select Date'),
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