// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:parking/bookings.dart';
import 'package:parking/mycartScreen.dart';
import 'package:parking/parkingScreen.dart';

class HomePage extends StatefulWidget {
  //const ({Key? key}) : super(key: key);
  // int x = 0;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String carNumber = "";
  late String? userID = "";
  late bool isPresent = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(
              'HOME',
              style: TextStyle(
                  fontSize: 26,
                  color: Color.fromRGBO(88, 80, 141, 1),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico'),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.directions_car_filled,
                  color: Color.fromRGBO(88, 80, 141, 1),
                ),
                onPressed: () {},
              ),
            ],
            backgroundColor: Color.fromRGBO(172, 162, 176, 0.3),
          ),
          drawer: Drawer(
              width: 250,
              backgroundColor: Color.fromRGBO(156, 151, 158, 0.898),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.white24),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage('images/profile.jpg'),
                      // radius: 50,
                    ),
                    accountName: Text(
                      '',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    accountEmail: Text(
                      carNumber,
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BookingPage()),
                      );
                    },
                    leading: Icon(
                      Icons.edit,
                      color: Color.fromRGBO(88, 80, 141, 1),
                    ),
                    title: Text(
                      'Bookings',
                      style: TextStyle(
                          color: Colors.white70,
                          // fontFamily: 'Source Sans Pro',
                          fontSize: 20),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.history,
                      color: Color.fromRGBO(88, 80, 141, 1),
                    ),
                    title: Text(
                      'History',
                      style: TextStyle(
                          color: Colors.white70,
                          // fontFamily: 'Source Sans Pro',
                          fontSize: 20),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Color.fromRGBO(88, 80, 141, 1),
                    ),
                    onTap: () {},
                    title: Text(
                      'Log out',
                      style: TextStyle(
                          color: Colors.white70,
                          // fontFamily: 'Source Sans Pro',
                          fontSize: 20),
                    ),
                  ),
                ],
              )),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Add some content to the Expanded widget
                      SizedBox(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(47.0),
                                child: SizedBox(
                                    // width: 420,
                                    // height: 300,
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 340,
                                      height: 200,
                                      child: AspectRatio(
                                        aspectRatio: 487 / 451,
                                        child: CircleAvatar(
                                          radius: 170,
                                          backgroundColor:
                                              Color.fromRGBO(88, 80, 141, 1),
                                          child: CircleAvatar(
                                            radius: 97,
                                            backgroundImage:
                                                AssetImage(('images/lot1.png')),
                                            backgroundColor:
                                                Color.fromRGBO(88, 80, 141, 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40.0, 25.0, 40.0, 0.0),
                                        child: MaterialButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ReservationScreen(),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              ' Reserve Parking',
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    238, 238, 238, 1),
                                                fontSize: 20.0,
                                                fontFamily: 'Padauk',
                                                //fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              side: BorderSide(
                                                  color: Color.fromRGBO(
                                                      88, 80, 141, 1),
                                                  width: 1.0),
                                            ),
                                            color:
                                                Color.fromRGBO(88, 80, 141, 1),
                                            textColor: Colors.black,
                                            padding: EdgeInsets.fromLTRB(
                                                10, 15, 10, 15)
                                            // minWidth: double.infinity,
                                            ),
                                      ),
                                    ),
                                  ],
                                )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: SizedBox(
                                    // width: 420,
                                    // height: 300,
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 340,
                                      height: 200,
                                      child: AspectRatio(
                                        aspectRatio: 487 / 451,
                                        child: CircleAvatar(
                                          radius: 170,
                                          backgroundColor:
                                              Color.fromRGBO(88, 80, 141, 1),
                                          child: CircleAvatar(
                                            radius: 97,
                                            backgroundImage: AssetImage(
                                                ('images/new/payment.jpeg')),
                                            backgroundColor:
                                                Color.fromRGBO(88, 80, 141, 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40.0, 25.0, 40.0, 20.0),
                                        child: MaterialButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyCartBody(),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              ' Pay with Visa',
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    238, 238, 238, 1),
                                                fontSize: 20.0,
                                                fontFamily: 'Padauk',
                                                //fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              side: BorderSide(
                                                  color: Color.fromRGBO(
                                                      88, 80, 141, 1),
                                                  width: 1.0),
                                            ),
                                            color:
                                                Color.fromRGBO(88, 80, 141, 1),
                                            textColor: Colors.black,
                                            padding: EdgeInsets.fromLTRB(
                                                20, 15, 20, 15)
                                            // minWidth: double.infinity,
                                            ),
                                      ),
                                    ),
                                  ],
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
