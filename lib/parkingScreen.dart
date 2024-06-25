// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
//import 'package:parking/homePage.dart';
import 'package:parking/succesfullybooked.dart';

void main() {
  runApp(ReservationPage());
}

class ReservationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reservation Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: ReservationScreen(),
    );
  }
}

class ReservationScreen extends StatefulWidget {
  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  TimeOfDay? fromTime;
  TimeOfDay? toTime;
  int bookedUsersCount = 0;

  void bookReservation() {
    setState(() {
      if (bookedUsersCount < 8) {
        if (fromTime != null && toTime != null) {
          final int differenceInMinutes =
              calculateTimeDifferenceInMinutes(fromTime!, toTime!);
          if (differenceInMinutes >= 0 && differenceInMinutes <= 60) {
            bookedUsersCount++;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SuccessPage(),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Only one hour or less allowed for reservation.',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Please select reservation time.',
                style: TextStyle(color: Colors.red),
              ),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Maximum users reached. Please choose another hour.',
              style: TextStyle(color: Colors.red),
            ),
          ),
        );
      }
    });
  }

  int calculateTimeDifferenceInMinutes(TimeOfDay from, TimeOfDay to) {
    final int fromMinutes = from.hour * 60 + from.minute;
    final int toMinutes = to.hour * 60 + to.minute;
    return toMinutes - fromMinutes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: const Color.fromRGBO(172, 162, 176, 0.3),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: new BoxDecoration(color: Colors.white),
              height: 350,
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    'images/reserve_page.png',
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(top: 0.0, bottom: 0, left: 30),
                child: Center(
                  child: RichText(
                    maxLines: 2,
                    text: const TextSpan(
                        text: "Kindly ",
                        style: TextStyle(
                          wordSpacing: 4,
                          color: Colors.black,
                          fontSize: 28,
                          fontFamily: 'CantoraOne',
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Choose You Perferable             ",
                            style: TextStyle(
                              wordSpacing: 4,
                              color: Color.fromRGBO(88, 80, 141, 1),
                              fontSize: 28,
                              fontFamily: 'CantoraOne',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '      iiiiii  v  ',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: " Time to Park",
                            style: TextStyle(
                              wordSpacing: 4,
                              color: Colors.black,
                              fontSize: 28,
                              fontFamily: 'CantoraOne',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final selectedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (selectedTime != null) {
                        setState(() {
                          fromTime = selectedTime;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      minimumSize: Size(130, 50), //////// HERE
                    ),
                    child: Text(
                      fromTime != null ? fromTime!.format(context) : 'From',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      minimumSize: Size(130, 50), //////// HERE
                    ),
                    onPressed: () async {
                      final selectedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (selectedTime != null) {
                        setState(() {
                          toTime = selectedTime;
                        });
                      }
                    },
                    child: Text(
                      toTime != null ? toTime!.format(context) : 'To',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SuccessPage()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, bottom: 1.0, left: 40, right: 40),
                child: Container(
                  width: 50,
                  height: 60,
                  decoration: ShapeDecoration(
                    // color:
                    color: Color.fromRGBO(88, 80, 141, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Reserve',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
