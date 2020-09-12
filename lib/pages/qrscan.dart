import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class ScanQr extends StatefulWidget {
  @override
  _ScanQrState createState() => _ScanQrState();
}

class _ScanQrState extends State<ScanQr> {
  String _outputController;

  @override
  Widget build(BuildContext context) {
    return null;
  }

  Future _scan() async {
    String barcode = await scanner.scan();
    this._outputController = barcode;
  }
}
