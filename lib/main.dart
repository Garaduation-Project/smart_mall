// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'logIN.dart';
//import 'package:firebase_auth/firebase_auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage0(),
  ));
}

class HomePage0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FadeInUp(
              child: Image(
                image: AssetImage('images/getstarted.png'),
                // height: 500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                // color: Colors.greenAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: FadeInUp(
                        child: Text(
                          'MALL',
                          style: TextStyle(
                              fontSize: 40,
                              color: Color.fromRGBO(88, 80, 141, 1),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Pacifico'),
                        ),
                      ),
                    ),
                    FadeInUp(
                      child: Text(
                        'Hello dear',
                        style: TextStyle(
                            color: Color.fromRGBO(189, 185, 191, 1),
                            fontSize: 20,
                            fontFamily: 'Padauk'),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(40.0, 100.0, 40.0, 18.0),
                      child: FadeInUp(
                        child: Text(
                          'We Hope You Enjoy Your Shopping',
                          style: TextStyle(
                              color: Color.fromRGBO(189, 185, 191, 1),
                              fontSize: 16,
                              fontFamily: 'Padauk'),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 60.0),
                      child: FadeInUp(
                        child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NameScreen(),
                                ),
                              );
                            },
                            child: Text(
                              ' Get Started  → ',
                              style: TextStyle(
                                color: Color.fromRGBO(238, 238, 238, 1),
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                  color: Color.fromRGBO(88, 80, 141, 1),
                                  width: 1.0),
                            ),
                            color: Color.fromRGBO(88, 80, 141, 1),
                            textColor: Colors.black,
                            padding: EdgeInsets.fromLTRB(10, 16, 10, 16)
                            // minWidth: double.infinity,
                            ),
                      ),
                    ),
                  ], //
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

