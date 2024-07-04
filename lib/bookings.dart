import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parking/paymentScreen.dart';
import 'package:parking/paymob_manager/paymobManager.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class PriceInfoBox extends StatelessWidget {
  final double minutePrice;
  final double totalPrice;

  PriceInfoBox({required this.minutePrice, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Color.fromRGBO(242, 242, 242, 1),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPriceRow(
                  'Minute Price:', '\EGP ${minutePrice.toStringAsFixed(2)}'),
              SizedBox(height: 30),
              _buildPriceRow('Total:', '\EGP${totalPrice.toStringAsFixed(2)}'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPriceRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class ParkingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Color.fromRGBO(242, 242, 242, 1),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'images/bookings.png', // Replace with your image path
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInfoTile(Icons.access_time, '60 minutes'),
                _buildInfoTile(Icons.location_on, 'A-6'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: Colors.black),
        SizedBox(
          width: 8,
        ),
        Text(label, style: TextStyle(color: Colors.black)),
      ],
    );
  }
}

class _BookingPageState extends State<BookingPage> {
  get totalPrice => null;

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
            icon: Icon(Icons.car_rental_sharp),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: ParkingCard(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Center(
                child: PriceInfoBox(
                  minutePrice: 0.25,
                  totalPrice: 15,
                ),
              ),
            ]),
          ),
          //SizedBox(height: 50.0),
          // const SizedBox(height: 16),
          GestureDetector(
            onTap: () async => _pay(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 40, 30, 50),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: ShapeDecoration(
                  // color:
                  color: Color.fromRGBO(88, 80, 141, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Complete Payment',
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

  Future<void> _pay() async {
    PaymobManager()
        .getPaymentKey(totalPrice.toInt(), "EGP")
        .then((String paymentKey) {
      Navigator.pop(context); // Hide loading dialog
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentWebView(
            paymentUrl:
                "https://accept.paymob.com/api/acceptance/iframes/840752?payment_token=$paymentKey",
            price: totalPrice, // Pass totalPrice to PaymentWebView
          ),
        ),
      );
    });
  }
}
