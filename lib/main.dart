
import 'package:flutter/material.dart';

class Field {
  final String title;
  final String imageUrl;
  final double price;
  final String type;
  final int Players;

  Field({required this.title, required this.imageUrl, required this.price, required this.type, required this.Players});
}

class FieldCard extends StatelessWidget {
  final Field field;

  FieldCard({required this.field});

  @override
  Widget build(BuildContext context) {
    return Card(
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
        Players: 12),
    Field(
        title: 'CENTRE DE FOOTBALL',
        imageUrl: 'https://www.gannett-cdn.com/presto/2019/08/16/PPHX/3a86ff23-35c7-4380-9c53-270f2d4e8cd4-foto_no_exif.jpg?width=660&height=440&format=pjpg&auto=webp',
        price: 19.99,
        type: '5vs5',
        Players: 9),
    Field(
        title: 'LE COIN DE FOORBALL',
        imageUrl: 'https://www.gannett-cdn.com/presto/2019/08/16/PPHX/3a86ff23-35c7-4380-9c53-270f2d4e8cd4-foto_no_exif.jpg?width=660&height=440&format=pjpg&auto=webp',
        price: 29.99,
        type: '6vs6',
        Players: 12),
  ];

  @override
  void initState() {
     super.initState();
    // Simulate an asynchronous operation to fetch data
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? _buildLoadingScreen() 
        : Scaffold(
            appBar: AppBar(
              title: Text('Fields'),
            ),
            body: ListView.builder(
              itemCount: fields.length,
              itemBuilder: (context, index) {
                return FieldCard(field: fields[index]);
              },
            ),
          );
  }

  Widget _buildLoadingScreen() {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Image.asset(
            'assets/logo.png',
            height: 150.0,
            width: 150.0,
          ),
          SizedBox(height: 16.0),
        
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Add your login logic here
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
 void main() {
   runApp(MaterialApp(
     home: MyHomePage(),
   ));
 }