import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:orapay_prokit/screens/op_purchase_more_screen.dart';
import 'package:orapay_prokit/utils/Colors.dart';
import 'package:orapay_prokit/utils/OPWidgets.dart';

class OPTransactionDetailsScreen extends StatefulWidget {
  @override
  _OPTransactionDetailsScreenState createState() => _OPTransactionDetailsScreenState();
}

class _OPTransactionDetailsScreenState extends State<OPTransactionDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: getAppBar(
          '12 March 1997',
          pressed: () {
            finish(context);
          },
          showBack: true,
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            PurchaseMoreScreen(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ButtonBars(
                    title: 'Print',
                    icon: Icons.print,
                    color: opPrimaryColor,
                  ),
                  ButtonBars(
                    size: size,
                    title: 'Refund',
                    icon: Icons.assignment_return,
                    color: opOrangeColor,
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
