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
  DateTime _selectedDate = DateTime.now();

  void _showReservationConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Réservation réussie'),
          content: Text('Votre réservation a été effectuée avec succès.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDatePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 7)),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

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
                  'Choisir une date:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: _showDatePicker,
                    ),
                    SizedBox(width: 16.0),
                    Text(
                      'Selected Date: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                    ),
                  ],
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
                      value: '14:00 AM',
                      child: Text('14:00 AM'),
                    ),
                    DropdownMenuItem(
                      value: '20:00 AM',
                      child: Text('20:00 AM'),
                    ),
                    
                  ],
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    _showReservationConfirmation();
                 
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
