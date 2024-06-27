import 'package:flutter/material.dart';
import 'package:parking/mycartScreen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQR extends StatefulWidget {
  @override
  _ScanQRState createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text(
            'QR Scanner',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Color.fromRGBO(88, 80, 141, 1),
              fontFamily: 'Pacifico',
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.qr_code,
              color: Color.fromRGBO(96, 87, 156, 1),
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: QRView(
              key: _qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      _controller = controller;
    });
    _controller!.scannedDataStream.listen((scanData) {
      // ignore: unnecessary_null_comparison
      if (scanData != null) {
        _controller!.pauseCamera(); 
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyCartBody(
                    scannedPrice: scanData.code,
                    discount: '0.0', // Replace with actual discount value
                    totalPrice: scanData.code,
                  )),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}


