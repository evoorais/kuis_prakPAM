import 'package:flutter/material.dart';
import 'package:jam_tangan/screens/home_screen.dart';
import 'package:jam_tangan/screens/pembayaran_screen.dart';

void main() => runApp(BookingScreen());

class BookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BookingPage(),
    );
  }
}

class BookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Blue Lagoon'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              'https://raw.githubusercontent.com/asfararikza/assets_bluedoorz/refs/heads/main/hotel.jpg',
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Blue Lagoon',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Rp 500.000/Night',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.redAccent,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Booking Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  BookingForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookingForm extends StatefulWidget {
  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _roomController = TextEditingController();
  final TextEditingController _nightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Full Name',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your full name';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _roomController,
            decoration: InputDecoration(
              labelText: 'Total Room',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the number of rooms';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _nightController,
            decoration: InputDecoration(
              labelText: 'Total Night',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the number of nights';
              }
              return null;
            },
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentPage(),
                  ),
                );
              }
            },
            child: Text('Book Now'),
          ),
        ],
      ),
    );
  }
}
