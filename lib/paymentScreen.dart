import 'package:flutter/material.dart';
import 'package:parking/thankYouScreen.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'failed_paying.dart';

class PaymentWebView extends StatefulWidget {
  final String paymentUrl;
  final double price;

  PaymentWebView({required this.paymentUrl, required this.price});

  @override
  _PaymentWebViewState createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  // ignore: unused_field
  late WebViewController _webViewController;
  bool isLoading = true; // Track if a navigation action is in progress

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
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
              Icons.payment,
              color: Color.fromRGBO(96, 87, 156, 1),
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.paymentUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _webViewController = webViewController;
            },
            onPageStarted: (url) {
              setState(() {
                isLoading = true;
              });
            },
            onPageFinished: (url) {
              setState(() {
                isLoading = false;
              });
            },
            navigationDelegate: (NavigationRequest request) {
              if (request.url.contains('success') && !isLoading) {
                // Navigate to ThankYouView if 'success' detected
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThankYouView(price: widget.price),
                  ),
                );
                return NavigationDecision.prevent;
              } else if (request.url.contains('failure') && !isLoading) {
                // Navigate to FailureScreen if 'failure' detected
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => FailureScreen()),
                );
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
          ),
          if (isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
