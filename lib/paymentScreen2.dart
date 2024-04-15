// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:parking/thankYouScreen.dart';
import 'package:parking/widget/custom_credit_card.dart';

// ignore: must_be_immutable
class PaymentDetailsView extends StatelessWidget {
  PaymentDetailsView({super.key});

  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeInUp(
            child: Text(
          'Payment',
          style: TextStyle(
            color: Color.fromRGBO(88, 80, 141, 1),
            fontFamily: 'Pacifico',
            fontSize: 26,
          ),
        )),
        actions: <Widget>[
          FadeInUp(
            child: IconButton(
              icon: Icon(
                Icons.payment_outlined,
                color: Color.fromRGBO(88, 80, 141, 1),
              ),
              onPressed: () {},
            ),
          ),
        ],
        backgroundColor: Color.fromRGBO(172, 162, 176, 0.1),
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
                    padding: const EdgeInsets.fromLTRB(16, 50, 16, 25),
                    //change
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ThankYouView()),
                        );
                      },
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
                            "Pay",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromRGBO(238, 238, 238, 1),
                              fontSize: 26,
                              fontFamily: 'Inter',
                              height: 0,
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
