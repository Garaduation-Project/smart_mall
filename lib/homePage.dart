import 'package:flutter/material.dart';
import 'package:parking/bookings.dart';
import 'package:parking/logIN.dart';
import 'package:parking/models/logout_api_model.dart';
import 'package:parking/mycartScreen.dart';
import 'package:parking/parkingScreen.dart'; // Import the user service

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String carNumber = "";
  late String userID = "";
  late String username = "";
  late bool isPresent = false;

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    final userDetails = await LogOutApiModel.getUserDetails();
    if (userDetails != null) {
      setState(() {
        carNumber = userDetails['number_plate'];
        userID = userDetails['userID'];
        username = userDetails['username'];
      });
    } else {
      print('Failed to load user details');
    }
  }

  Future<void> logOut() async {
    final result = await LogOutApiModel.logOut();
    if (result) {
      setState(() {
        carNumber = "";
        userID = "";
        username = "";
        isPresent = false;
      });
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) =>
                NameScreen()), // Replace with your login screen
      );
    } else {
      print('Failed to log out');
    }
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
                    backgroundImage: AssetImage('images/login.png'),
                  ),
                  accountName: Text(
                    username,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  accountEmail: Text(
                    carNumber,
                    style: TextStyle(color: Colors.black),
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
                    style: TextStyle(color: Colors.white70, fontSize: 20),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.history,
                    color: Color.fromRGBO(88, 80, 141, 1),
                  ),
                  title: Text(
                    'History',
                    style: TextStyle(color: Colors.white70, fontSize: 20),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Color.fromRGBO(88, 80, 141, 1),
                  ),
                  onTap: logOut,
                  title: Text(
                    'Log out',
                    style: TextStyle(color: Colors.white70, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(47.0),
                                child: SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  AssetImage('images/lot1.png'),
                                              backgroundColor: Color.fromRGBO(
                                                  88, 80, 141, 1),
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
                                                color: Colors.white,
                                                fontSize: 22.0,
                                                fontFamily: 'Cantoraone',
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
                                                10, 15, 10, 15),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  'images/new/payment.jpeg'),
                                              backgroundColor: Color.fromRGBO(
                                                  88, 80, 141, 1),
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
                                                color: Colors.white,
                                                fontSize: 22.0,
                                                fontFamily: 'Cantoraone',
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
                                                20, 15, 20, 15),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
