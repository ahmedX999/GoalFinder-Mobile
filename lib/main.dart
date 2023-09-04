import 'package:flutter/material.dart';
import 'FieldDetailsScreen.dart';
import 'LoginPage.dart';
import 'ListReservation.dart';
import 'AdvancedSearch.dart';

class Field {
  final String title;
  final String imageUrl;
  final double price;
  final String type;
  final String players;
  final String details;
  final double longitude;
  final double latitude;

  Field({
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.type,
    required this.players,
    required this.details,
    required this.latitude,
    required this.longitude,
  });
}

class FieldCard extends StatelessWidget {
  final Field field;

  FieldCard({required this.field});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FieldDetailsScreen(field: field)),
        );
      },
      child: Card(
        elevation: 2.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/field.jpg',
              height: 150.0,
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
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Type: " + field.type,
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Joueurs: " + field.players.toString(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '${field.price.toStringAsFixed(2)}\ DH',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Field> fields = [
    Field(
      title: 'KickOff',
      imageUrl: 'assets/field.jpg',
      price: 60.0,
      type: '5 vs 5',
      players: '0',
      details: 'Field 1 details',
      latitude: 1.00015,
      longitude: -17.12201,
    ),
    Field(
      title: 'KickOff',
      imageUrl: 'assets/field.jpg',
      price: 70.0,
      type: '5 vs 5',
      players: '0',
      details: 'Field 2 details',
      latitude: 1.00015,
      longitude: -17.12201,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Field Booking'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                // Handle Home option
              },
            ),
            ListTile(
              title: Text('Reservations'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReservationListPage()),
                );
              },
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                // Handle About option
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                // Handle Logout option
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: fields.length,
        itemBuilder: (context, index) {
          return FieldCard(field: fields[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdvancedSearchScreen()),
          );
        },
        child: Icon(Icons.search),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}
