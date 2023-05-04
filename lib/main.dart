import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'AdvancedSearch.dart';
import 'FieldDetailsScreen.dart';

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

class FieldCard extends StatelessWidget {
  final Field field;

  FieldCard({required this.field});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FieldDetailsScreen(field: field)),
        );
      },
      child: Card(
        elevation: 2.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              field.imageUrl,
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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = true;
  List<Field> _fields = [];

  Future<List<Field>> _fetchFields() async {
    final response = await http.get(
        Uri.parse('https://645297ebbce0b0a0f74b4286.mockapi.io/fieldsdet'));
    if (response.statusCode == 200) {
      final List<Field> fields = [];
      final jsonData = json.decode(response.body);
      for (var item in jsonData) {
        final field = Field(
          title: item['title'],
          imageUrl: item['imageUrl'],
          price: double.parse(item['price']),
          type: item['type'],
          players: item['players'],
          details: item['details'],
        );
        fields.add(field);
      }
      return fields;
    } else {
      throw Exception('Failed to fetch fields from API aaaa');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchFields().then((fields) {
      setState(() {
        _isLoading = false;
        _fields = fields;
      });
    }).catchError((error) {
      setState(() {
        _isLoading = false;
      });
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to fetch fields from API: ${error.toString()}'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Field Booking'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _fields.length,
              itemBuilder: (context, index) {
                return FieldCard(field: _fields[index]);
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
    home: MyHomePage(),
  ));
}
