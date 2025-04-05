import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:orapay_prokit/model/OPModel.dart';
import 'package:orapay_prokit/screens/op_purchase_more_screen.dart';
import 'package:orapay_prokit/utils/Colors.dart';
import 'package:orapay_prokit/utils/OPDataProvider.dart';
import 'package:orapay_prokit/utils/OPWidgets.dart';

import 'op_dashboard.dart';

class OPUserDetailsScreen extends StatefulWidget {
  @override
  _OPUserDetailsScreenState createState() => _OPUserDetailsScreenState();
}

class _OPUserDetailsScreenState extends State<OPUserDetailsScreen> {
  PageController pageController = PageController(initialPage: 0);
  int pageNumber = 0;

  List<OPPickVerifyModel> cardList = getCardListItems();

  List<Widget> buildDotIndicator() {
    List<Widget> list = [];
    for (int i = 0; i <= 3; i++) {
      list.add(i == pageNumber ? indicator(isActive: true) : indicator(isActive: false));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              height: double.infinity,
              child: PageView(
                onPageChanged: (index) => setState(() {
                  pageNumber = index;
                }),
                controller: pageController,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 16, bottom: 70, right: 16, top: size.height * 0.1),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(bottom: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          applogo(),
                          24.height,
                          Text("Fill your information", style: boldTextStyle(size: 24, letterSpacing: 0.2)),
                          24.height,
                          textField(title: 'Full name', image: Icons.event_note),
                          16.height,
                          textField(title: 'username', image: Icons.person_outline),
                          16.height,
                          textField(title: 'Date of birth', textInputType: TextInputType.datetime, image: Icons.calendar_today),
                          16.height,
                          textField(title: 'Phone number', image: Icons.phone_iphone),
                        ],
                      ),
                    ),
                  ),
                  PurchaseMoreScreen(),
                  Container(
                    padding: EdgeInsets.only(left: 16, bottom: 70, right: 16, top: size.height * 0.1),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(bottom: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          applogo(),
                          24.height,
                          Text("Address", style: boldTextStyle(size: 24, letterSpacing: 0.2)),
                          24.height,
                          textField(title: 'Main address', image: Icons.home),
                          16.height,
                          textField(title: 'Second address', image: Icons.home),
                          16.height,
                          textField(title: 'State', image: Icons.business),
                          16.height,
                          textField(title: 'Post Code', image: Icons.pin_drop),
                        ],
                      ),
                    ),
                  ),
                  PurchaseMoreScreen(),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 20),
              padding: EdgeInsets.only(left: 20, right: 8),
              width: size.width,
              height: 50,
              decoration: BoxDecoration(color: opPrimaryColor, borderRadius: BorderRadius.circular(15.0)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    child: Text('${pageNumber + 1}', style: primaryTextStyle(size: 16, color: opPrimaryColor)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: buildDotIndicator(),
                  ),
                  pageNumber != 3
                      ? TextButton(

                          onPressed: () {
                            pageController.nextPage(duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
                          },
                          child: Text('Next', style: primaryTextStyle(size: 16, color: opBackgroundColor)),
                        )
                      : TextButton(
                          onPressed: () {
                            finish(context);
                            OPBottomNavigationScreen().launch(context);
                          },
                          child: Text('Finish', style: primaryTextStyle(size: 16, color: opBackgroundColor)),
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
