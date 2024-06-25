import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:parking/bookings.dart';
// ignore: unused_import
import 'package:parking/homePage.dart';

void main() {
  runApp(SuccessPage());
}

class Successful extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reservation Page',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: SuccessPage(),
    );
  }
}

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Text(''),
        backgroundColor: Color.fromRGBO(172, 162, 176, 0.3),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 0.0, bottom: 10),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Successfuly Booked',
                  style: TextStyle(fontFamily: 'CantoraOne', fontSize: 23),
                ),
                Icon(
                  Icons.check_circle,
                  color: Color.fromRGBO(88, 80, 141, 1),
                  size: 100,
                ),
                SizedBox(height: 20),
                Text(
                  'Successfully booked!',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 40, 10, 40),
                  child: Center(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingPage(),
                          ),
                        );
                      },
                      child: Text(
                        ' Go To Your Bookings',
                        style: TextStyle(
                          color: Color.fromRGBO(238, 238, 238, 1),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                            color: Color.fromRGBO(88, 80, 141, 1), width: 1.0),
                      ),
                      color: Color.fromRGBO(88, 80, 141, 1),
                      textColor: Colors.black,
                      padding: EdgeInsets.fromLTRB(10, 16, 10, 16),

                      //
                      minWidth: 300,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
