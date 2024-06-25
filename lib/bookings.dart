import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parking/homePage.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final TextEditingController _codeController = TextEditingController();

  void _submitCode() {
    String enteredCode = _codeController.text;
    // Display a SnackBar with a welcome message
    final snackBar = SnackBar(
      backgroundColor: Color.fromRGBO(88, 80, 141, 1),
      content: Text(
        'Welcome To Smart Mall! Code submitted: $enteredCode',
      ),
      duration: Duration(seconds: 5),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // Clear the text field
    _codeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(172, 162, 176, 0.3),
        title: Text(
          'Your Bookings',
          style: TextStyle(
              fontSize: 28,
              color: Color.fromRGBO(88, 80, 141, 1),
              fontFamily: 'Pacifico'),
        ),
        actions: [
          IconButton(
            color: Color.fromRGBO(88, 80, 141, 1),
            icon: Icon(Icons.home),
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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _codeController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(6),
              ],
              decoration: InputDecoration(
                labelText: 'Enter 6-digit Code',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: Colors.grey, width: 0.7),
                ),
              ),
            ),
            SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 40, 10, 40),
              child: Center(
                child: MaterialButton(
                  onPressed: _submitCode,

                  child: Text(
                    ' Submit',
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
                  minWidth: 200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
