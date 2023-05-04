import 'package:flutter/material.dart';
import 'package:flutter_application_1/ReservationPage.dart';
import 'package:flutter_application_1/main.dart';

class FieldDetailsScreen extends StatelessWidget {
  final Field field;

  FieldDetailsScreen({required this.field});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(field.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              field.imageUrl,
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    field.title,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Type: " + field.type,
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Joueurs: " + field.players.toString(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${field.price.toStringAsFixed(2)}\ DH',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    field.details,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 32.0),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReservationPage(field: field),
            ),
          );
        },
        label: Text(
          'Réserver',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        icon: Icon(Icons.calendar_today_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
