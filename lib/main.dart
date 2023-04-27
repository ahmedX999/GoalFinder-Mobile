
import 'package:flutter/material.dart';
import 'AdvancedSearch.dart';
import 'FieldDetailsScreen.dart';

class Field {
  final String title;
  final String imageUrl;
  final double price;
  final String type;
  final int Players;
  final String Details;

  Field({required this.title, required this.imageUrl, required this.price, required this.type, required this.Players, required this.Details });
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
                          "Joueurs: " + field.Players.toString(),
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

  final List<Field> fields = [
    Field(
        title: 'KICK OFF MARRAKECH',
        imageUrl: 'https://www.gannett-cdn.com/presto/2019/08/16/PPHX/3a86ff23-35c7-4380-9c53-270f2d4e8cd4-foto_no_exif.jpg?width=660&height=440&format=pjpg&auto=webp',
        price: 9.99,
        type: '6vs6',
        Players: 12,
        Details : 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
    Field(
        title: 'CENTRE DE FOOTBALL',
        imageUrl: 'https://www.gannett-cdn.com/presto/2019/08/16/PPHX/3a86ff23-35c7-4380-9c53-270f2d4e8cd4-foto_no_exif.jpg?width=660&height=440&format=pjpg&auto=webp',
        price: 19.99,
        type: '5vs5',
        Players: 9,
        Details : 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
    Field(
        title: 'LE COIN DE FOORBALL',
        imageUrl: 'https://www.gannett-cdn.com/presto/2019/08/16/PPHX/3a86ff23-35c7-4380-9c53-270f2d4e8cd4-foto_no_exif.jpg?width=660&height=440&format=pjpg&auto=webp',
        price: 29.99,
        type: '6vs6',
        Players: 12,
        Details : 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
  ];

void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  void initState() {
    super.initState();
    // Simulate fetching data
    Future.delayed(Duration(seconds: 2), () {
      _toggleLoading();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Field Listings'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: fields.length,
              itemBuilder: (context, index) {
                return FieldCard(
                  field: fields[index],
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdvancedSearchScreen(),
            ),
          );
        },
        icon: Icon(Icons.search),
        label: Text('Advanced Search'),
      ),
    );
  }
}

 void main() {
   runApp(MaterialApp(
     home: MyHomePage(),
   ));
 }