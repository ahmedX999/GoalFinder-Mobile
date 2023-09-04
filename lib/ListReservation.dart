import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

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

  final String date;
  final String time;
  final Field field;
  final LatLng location;

  Reservation({

    required this.date,
    required this.time,
    required this.field,
    required this.location,
  });
}

class ReservationListPage extends StatelessWidget {
  final List<Field> fields = [
    Field(
      title: 'KickOff',
       imageUrl:
          'assets/field.jpg',
      price: 60.0,
      type: '5 vs 5',
      players: '0',
      details: 'Field 1 details',
    ),
    Field(
      title: 'KickOff',
      imageUrl:
          'assets/field.jpg',
      price: 60.0,
      type: '5 vs 5',
      players: '0',
      details: 'Field 2 details',
    ),
    Field(
      title: 'Urban',
      imageUrl:
          'assets/field.jpg',
      price: 70.0,
      type: '11 vs 11',
      players: '0',
      details: 'Field 3 details',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final List<Reservation> reservations = [
      Reservation(

        date: '2023-05-20',
        time: '10:00 AM',
        field: fields[0],
        location: LatLng(37.7749, -122.4194), 
      ),
      Reservation(
 
        date: '2023-05-21',
        time: '2:00 PM',
        field: fields[1],
        location: LatLng(34.0522, -118.2437), 
      ),
      Reservation(

        date: '2023-05-22',
        time: '6:00 PM',
        field: fields[2],
        location: LatLng(40.7128, -74.0060), // Example location
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Reservation List'),
      ),
      body: ListView.builder(
        itemCount: reservations.length,
        itemBuilder: (context, index) {
          final reservation = reservations[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MapPage(
                    location: reservation.location,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 2.0,
              child: ListTile(
                leading: Image.network(
                  reservation.field.imageUrl,
                  width: 150.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
                
                subtitle: Text('Field: ${reservation.field.title}'),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Date: ${reservation.date}'),
                    Text('Time: ${reservation.time}'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MapPage extends StatelessWidget {
  final LatLng? location;

  MapPage({required this.location});

  @override
  Widget build(BuildContext context) {
    if (location == null) {
      // Handle null location
      return Scaffold(
        appBar: AppBar(
          title: Text('Map'),
        ),
        body: Center(
          child: Text('Invalid location'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: location!,
          zoom: 13.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: location!,
                builder: (context) => Icon(
                  Icons.location_pin,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
