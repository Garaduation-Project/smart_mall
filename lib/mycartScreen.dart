import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'paymob_manager/paymobManager.dart';

class MyCartBody extends StatelessWidget {
  final String? scannedPrice;
  final String? discount;
  final String? totalPrice;

  const MyCartBody(
      {Key? key, this.scannedPrice, this.discount, this.totalPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double calculatedTotalPrice = calculateTotalPrice();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Color.fromRGBO(88, 80, 141, 1),
            fontFamily: 'Pacifico',
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.payment_outlined,
              color: Color.fromRGBO(96, 87, 156, 1),
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 90),
        child: Column(
          children: [
            const SizedBox(height: 18),
            Expanded(child: Image.asset('images/new/cartgirl.png')),
            const SizedBox(height: 25),
            Row(
              children: [
                Text(
                  'Order Subtotal',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                const Spacer(),
                Text(
                  '${double.parse(scannedPrice ?? '0').toStringAsFixed(2)} EGP',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 3),
            Row(
              children: [
                Text(
                  'Discount',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                const Spacer(),
                Text(
                  '${double.parse(discount ?? '0.0').toStringAsFixed(2)} EGP',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 3),
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
                    color: Colors.black45,
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                const Spacer(),
                Text(
                  '${calculatedTotalPrice.toStringAsFixed(2)} EGP',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black45,
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
              onTap: () async => _pay(),
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 1.0),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: ShapeDecoration(
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
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  double calculateTotalPrice() {
    double price = double.tryParse(scannedPrice ?? '0.0') ?? 0.0;
    double discountValue = double.tryParse(discount ?? '0.0') ?? 0.0;
    return price - discountValue;
  }

  Future<void> _pay() async {
    if (totalPrice != null) {
      PaymobManager()
          .getPaymentKey(int.parse(totalPrice!), "EGP")
          .then((String paymentKey) {
        launchUrl(
          Uri.parse(
              "https://accept.paymob.com/api/acceptance/iframes/840752?payment_token=$paymentKey"),
        );
      });
    }
  }
}
