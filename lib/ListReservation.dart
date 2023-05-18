import 'dart:math';

import 'package:flutter/material.dart';

class Field {
  final String title;
  final String imageUrl;
  final double price;
  final String type;
  final String players;
  final String details;

  Field({
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.type,
    required this.players,
    required this.details,
  });
}

class Reservation {
  final String name;
  final String date;
  final String time;
  final Field field;

  Reservation({
    required this.name,
    required this.date,
    required this.time,
    required this.field,
  });
}

class ReservationListPage extends StatelessWidget {
  final List<Reservation> reservations;
  final List<Field> fields = [
    Field(
      title: 'Field 1',
      imageUrl: 'https://example.com/field1.jpg',
      price: 50.0,
      type: 'Type A',
      players: '5 vs 5',
      details: 'Field 1 details',
    ),
    Field(
      title: 'Field 2',
      imageUrl: 'https://example.com/field2.jpg',
      price: 60.0,
      type: 'Type B',
      players: '7 vs 7',
      details: 'Field 2 details',
    ),
    Field(
      title: 'Field 3',
      imageUrl: 'https://example.com/field3.jpg',
      price: 70.0,
      type: 'Type C',
      players: '11 vs 11',
      details: 'Field 3 details',
    ),
  ];

  ReservationListPage({required this.reservations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservation List'),
      ),
      body: ListView.builder(
        itemCount: reservations.length,
        itemBuilder: (context, index) {
          final reservation = reservations[index];
          final randomField = fields[Random().nextInt(fields.length)];

          return Card(
            elevation: 2.0,
            child: ListTile(
              leading: Image.network(
                randomField.imageUrl,
                width: 80.0,
                height: 80.0,
                fit: BoxFit.cover,
              ),
              title: Text(reservation.name),
              subtitle: Text('Field: ${randomField.title}'),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Date: ${reservation.date}'),
                  Text('Time: ${reservation.time}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ReservationListPage(
      reservations: [
        Reservation(
          name: 'John Doe',
          date: '2023-05-20',
          time: '10:00 AM',
          field: Field(
            title: 'Field A',
            imageUrl: 'https://example.com/fieldA.jpg',
            price: 50.0,
            type: 'Type A',
            players: '5 vs 5',
            details: 'Field A details',
          ),
        ),
        Reservation(
          name: 'Jane Smith',
          date: '2023-05-21',
          time: '2:00 PM',
          field: Field(
            title: 'Field B',
            imageUrl: 'https://example.com/fieldB.jpg',
            price: 60.0,
            type: 'Type B',
            players: '7 vs 7',
            details: 'Field B details',
          ),
        ),
        Reservation(
          name: 'Mike Johnson',
          date: '2023-05-22',
          time: '6:00 PM',
          field: Field(
            title: 'Field C',
            imageUrl: 'https://example.com/fieldC.jpg',
            price: 70.0,
            type: 'Type C',
            players: '11 vs 11',
            details: 'Field C details',
          ),
        ),
      ],
    ),
  ));
}
