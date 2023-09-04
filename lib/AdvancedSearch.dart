import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class AdvancedSearchScreen extends StatefulWidget {
  @override
  _AdvancedSearchScreenState createState() => _AdvancedSearchScreenState();
}

class _AdvancedSearchScreenState extends State<AdvancedSearchScreen> {
  String selectedPerimeter = '10KM';
  String selectedType = '6vs6';
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String selectedDuration = '1H';
  String name = '';
  String city = '';

  List<String> perimeters = ['10KM', '20KM', '50KM'];
  List<String> types = ['6vs6', '5vs5', '7vs7'];
  List<String> durations = ['1H', '1.5H', '2H'];

  Future<void> _showTimePicker(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advanced Search'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  city = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'City',
              ),
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: selectedPerimeter,
              items: perimeters.map((perimeter) {
                return DropdownMenuItem<String>(
                  value: perimeter,
                  child: Text(perimeter),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedPerimeter = value!;
                });
              },
              decoration: InputDecoration(
                labelText: 'Perimeter',
              ),
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: selectedType,
              items: types.map((type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedType = value!;
                });
              },
              decoration: InputDecoration(
                labelText: 'Type',
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  tooltip: 'Tap to open date picker',
                  onPressed: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(Duration(days: 7)),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        selectedDate = pickedDate;
                      });
                    }
                  },
                ),
                SizedBox(width: 16.0),
                Text(
                  'Selected Date: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.access_time),
                  tooltip: 'Tap to open time picker',
                  onPressed: () async {
                    final pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      setState(() {
                        selectedTime = pickedTime;
                      });
                    }
                  },
                ),
                SizedBox(width: 16.0),
                Text(
                  'Selected Time: ${selectedTime.hour}:${selectedTime.minute}',
                ),
              ],
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: selectedDuration,
              items: durations.map((duration) {
                return DropdownMenuItem<String>(
                  value: duration,
                  child: Text(duration),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedDuration = value!;
                });
              },
              decoration: InputDecoration(
                labelText: 'Duration',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ),
                );
                // Add your search functionality here, using the selected search criteria
                print('Search Button Pressed');
                print('Name: $name');
                print('City: $city');
                print('Selected Perimeter: $selectedPerimeter');
                print('Selected Type: $selectedType');
                print('Selected Date: $selectedDate');
                print('Selected Time: $selectedTime');
                print('Selected Duration: $selectedDuration');
              },
              child: Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}
