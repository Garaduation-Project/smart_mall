// ignore_for_file: duplicate_import

import 'package:flutter/material.dart';
import 'package:parking/parking_thank.dart';
import 'package:parking/parking_thank.dart';
import 'package:parking/widget/custom_credit_card.dart';

// ignore: must_be_immutable
class ParkPaymentDetailsView extends StatelessWidget {
  ParkPaymentDetailsView({super.key});

  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(172, 162, 176, 0.3),
        title: Text(
          'Payment Details',
          style: TextStyle(
            color: Color.fromRGBO(88, 80, 141, 1),
            fontFamily: 'Pacifico',
            fontSize: 26,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.payment_outlined,
              color: Color.fromRGBO(88, 80, 141, 1),
            ),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // const SliverToBoxAdapter(
          //   child: PaymentMethodsListView(),
          // ),
          SliverToBoxAdapter(
            child: CustomCreditCard(
              autovalidateMode: autovalidateMode,
              formKey: formKey,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 50, 16, 20),
                    //change
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ParkingThankYou()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(50.0),
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
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Text(
                                "Pay",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 32,
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
                    ))),
          ),
        ],
      ),
    );
  }
}
