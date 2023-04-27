import 'package:flutter/material.dart';

import 'package:flutter_application_1/main.dart';

class ReservationPage extends StatefulWidget {
  final Field field;

  ReservationPage({required this.field});

  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  String _selectedTime = 'Select a time';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Réserver'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            widget.field.imageUrl,
            height: 200.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.0),
                Text(
                  widget.field.title,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Choisir un temps:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                DropdownButton<String>(
                  value: _selectedTime,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedTime = newValue!;
                    });
                  },
                  items: [
                    DropdownMenuItem(
                      value: 'Select a time',
                      child: Text('Select a time'),
                    ),
                    DropdownMenuItem(
                      value: '8:00 AM',
                      child: Text('8:00 AM'),
                    ),
                    DropdownMenuItem(
                      value: '9:00 AM',
                      child: Text('9:00 AM'),
                    ),
                    DropdownMenuItem(
                      value: '10:00 AM',
                      child: Text('10:00 AM'),
                    ),
                    DropdownMenuItem(
                      value: '11:00 AM',
                      child: Text('11:00 AM'),
                    ),
                    DropdownMenuItem(
                      value: '12:00 PM',
                      child: Text('12:00 PM'),
                    ),
                    DropdownMenuItem(
                      value: '1:00 PM',
                      child: Text('1:00 PM'),
                    ),
                    DropdownMenuItem(
                      value: '2:00 PM',
                      child: Text('2:00 PM'),
                    ),
                    DropdownMenuItem(
                      value: '3:00 PM',
                      child: Text('3:00 PM'),
                    ),
                    DropdownMenuItem(
                      value: '4:00 PM',
                      child: Text('4:00 PM'),
                    ),
                    DropdownMenuItem(
                      value: '5:00 PM',
                      child: Text('5:00 PM'),
                    ),
                    DropdownMenuItem(
                      value: '6:00 PM',
                      child: Text('6:00 PM'),
                    ),
                    DropdownMenuItem(
                      value: '7:00 PM',
                      child: Text('7:00 PM'),
                    ),
                    DropdownMenuItem(
                      value: '8:00 PM',
                      child: Text('8:00 PM'),
                    ),
                    DropdownMenuItem(
                      value: '9:00 PM',
                      child: Text('9:00 PM'),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Handle reservation submission
                  },
                  child: Text('Réserver'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
