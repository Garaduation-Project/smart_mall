import 'package:flutter/material.dart';
import 'package:parking/pass_reset/pass_reset.dart';

class EntreEmailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(172, 162, 176, 0.3),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Color.fromRGBO(88, 80, 141, 1)),
            onPressed: () {
              // Implement more options
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 27.0),
            child: Icon(
              Icons.alternate_email,
              size: 130,
              color: Color.fromRGBO(88, 80, 141, 1),
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                labelText: '   Email',
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Please enter your email to send confirmation code to reset new password',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResetPasswordPage()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 50),
              child: Container(
                width: 200,
                height: 60,
                decoration: ShapeDecoration(
                  // color:
                  color: Color.fromRGBO(88, 80, 141, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Center(
                  child: Text(
                    'OK',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontFamily: 'Cantoraone',
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
    );
  }
}
