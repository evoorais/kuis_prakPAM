import 'package:flutter/material.dart';
import 'package:jam_tangan/screens/booking_screen.dart';
import 'profile_screen.dart';


class HomeScreen extends StatelessWidget {
  final String username;

  HomeScreen({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: Text('Blue Doorz', style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.white,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(username: username),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
            child: Row (
              mainAxisAlignment : MainAxisAlignment.spaceEvenly,
              children: [
                Image.network('https://raw.githubusercontent.com/asfararikza/assets_bluedoorz/refs/heads/main/BLUE%20DOORZ.png'),
              ],
            )
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Welcome, $username!',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: 4, 
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network('https://raw.githubusercontent.com/asfararikza/assets_bluedoorz/refs/heads/main/hotel.jpg', height: 100, fit: BoxFit.cover),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Blue Lagoon'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Rp500.000/night'),
                      ),
                      Spacer(),
                      Center(
                        child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white, 
                                        foregroundColor: Colors.purple, 
                                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                                        textStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30), 
                                        ),
                                      ),                          
                      onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookingPage(),
                              ),
                            );
                          },
                          child: Text('Book Now'),
                        ),
                      ),
                      Spacer()
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
