import 'package:flutter/material.dart';
import 'package:orapay_prokit/screens/op_purchase_more_screen.dart';

class OPTransferScreen extends StatefulWidget {
  @override
  _OPTransferScreenState createState() => _OPTransferScreenState();
}

class _OPTransferScreenState extends State<OPTransferScreen> {
  @override
  Widget build(BuildContext context) {
    return PurchaseMoreScreen(enableAppbar: true);
  }
}
