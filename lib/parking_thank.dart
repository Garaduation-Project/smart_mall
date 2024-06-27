import 'package:flutter/material.dart';
import 'package:parking/homePage.dart';
import 'package:parking/parking_payment.dart';

class ParkingThankYou extends StatelessWidget {
  const ParkingThankYou({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ThankYouPage(),
    );
  }
}

class ThankYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Thank You',
          style: TextStyle(
            color: Color.fromRGBO(88, 80, 141, 1),
            fontFamily: 'Pacifico',
            fontSize: 26,
          ),
        ),
        backgroundColor: Color.fromRGBO(172, 162, 176, 0.3),
        actions: [
          IconButton(
            color: Color.fromRGBO(88, 80, 141, 1),
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle, // Change this to your custom icon if needed
              size: 140,
              color: Color.fromRGBO(88, 80, 141, 1),
            ),
            SizedBox(height: 10),
            Text(
              'Done',
              style: TextStyle(
                fontSize: 46,
                fontFamily: 'Cantoraone',
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(88, 80, 141, 1),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'We Hope To See You Soon!',
              style: TextStyle(
                  fontSize: 24, color: Color.fromRGBO(111, 109, 113, 0.8)),
            ),
          ],
        ),
      ),
    );
  }
}
