import 'package:flutter/material.dart';
import 'package:viroshop/CustomWidgets/BackgroundAnimation.dart';
import 'package:viroshop/CustomWidgets/CustomAppBar.dart';
import 'package:viroshop/Utilities/Constants.dart';
import 'package:viroshop/Utilities/CustomTheme.dart';
import 'package:viroshop/Utilities/Util.dart';
import 'package:viroshop/Views/NavigationViews/NavigationViewTemplate.dart';
import 'package:viroshop/Views/StoreNavigationView.dart';

// ignore: must_be_immutable
class Cart extends StatefulWidget implements NavigationViewTemplate{
  final StoreNavigationView parent;
  Cart(this.parent);

  _CartState state = _CartState();
  @override
  _CartState createState() => state;

  @override
  Future<void> update() {
    print("updating Cart");
    return null;
  }
}

class _CartState extends State<Cart> {

  void openPaymentScreen(){
    //TODO ZBIK
    print("ZBIK");
  }

  @override
  Widget build(BuildContext context) {
    final mediaSize = Util.getDimensions(context);
    return Container(
      color: CustomTheme().background,
      child: Stack(
        children: [
          BackgroundAnimation(),
          //TODO Koszyk
          Container(
            child: Column(
              children: [
                CustomAppBar("Koszyk",
                  withOptionButton: true,
                  optionButtonWidget: Text(
                    "Zamów",
                    style: TextStyle(
                      fontSize: mediaSize.width * Constants.appBarFontSize * 0.9,
                      fontWeight: FontWeight.w400,
                      color: CustomTheme().appBarTheme,
                    ),
                  ),
                  optionButtonAction: openPaymentScreen,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}