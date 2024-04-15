import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parking/paymentScreen2.dart';

class MyCartBody extends StatelessWidget {
  const MyCartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: FadeInUp(
            child: Text(
          'My Cart',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Color.fromRGBO(88, 80, 141, 1),
              fontFamily: 'Pacifico'),
        )),
        actions: <Widget>[
          FadeInUp(
            child: IconButton(
              icon: Icon(
                Icons.payment_outlined,
                color: Color.fromRGBO(96, 87, 156, 1),
              ),
              onPressed: () {},
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 90),
        child: Column(
          children: [
            const SizedBox(
              height: 18,
            ),
            Expanded(child: Image.asset('images/new/cartgirl.png')),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Text(
                  'Order Subtotal',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                const Spacer(),
                Text(
                  r'42.97$',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            Row(
              children: [
                Text(
                  'Discount',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                const Spacer(),
                Text(
                  r'0$',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            const Divider(
              thickness: 2,
              height: 34,
              color: Color(0xffC7C7C7),
            ),
            Row(
              children: [
                Text(
                  'Total',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                const Spacer(),
                Text(
                  r'$50.97',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentDetailsView()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 1.0),
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
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
