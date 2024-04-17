import 'package:flutter/material.dart';
import 'package:parking/thankYouView.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf6f6f6),
      body: Transform.translate(
        offset: const Offset(0, -16),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              ThankYouCard(),
              Positioned(
                bottom: MediaQuery.sizeOf(context).height * .2 + 20,
                left: 20 + 8,
                right: 20 + 8,
                child: Row(
                  children: List.generate(
                    30,
                    (index) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Container(
                          color: Color(0xFF8c8caa),
                          height: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  left: -20,
                  bottom: MediaQuery.sizeOf(context).height * .2,
                  child: CircleAvatar(
                    backgroundColor: Color(0xFFf6f6f6),
                  )),
              Positioned(
                  right: -20,
                  bottom: MediaQuery.sizeOf(context).height * .2,
                  child: CircleAvatar(
                    backgroundColor: Color(0xFFf6f6f6),
                  )),
              Positioned(
                top: -50 + 70,
                left: 0,
                right: 0,
                child: const CircleAvatar(
                  radius: 50,
                  backgroundColor: const Color(0xFFEDEDED),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: const Color(0xFF58508d),
                    child: Icon(
                      Icons.check,
                      size: 50,
                      color: const Color(0xFFEDEDED),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
