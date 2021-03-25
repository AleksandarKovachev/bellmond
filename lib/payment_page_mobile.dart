import 'package:bellmond/core/card_navigation.dart';
import 'package:bellmond/core/util/size_config.dart';
import 'package:bellmond/core/widget/responsive_widget.dart';
import 'package:bellmond/footer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentPageMobile extends StatelessWidget {
  final CardNavigation cardNavigation;

  PaymentPageMobile({Key key, this.cardNavigation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: ResponsiveWidget.isSmallScreen(context)
                  ? SizeConfig.screenWidth / 20
                  : 150),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Hero(
                  tag: cardNavigation.title,
                  child: Image.asset(
                    cardNavigation.image.replaceFirst(".png", "_full.png"),
                    scale: 2.5,
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.screenWidth / 20),
              Center(
                child: Text(
                  "ИЗБЕРИ ВНОСКИ",
                  style: TextStyle(
                      fontFamily: "Montserrat", fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: SizeConfig.screenWidth / 20),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 1, color: Colors.white),
                      ),
                      onPressed: () {},
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                                fontFamily: "Bebas Neue", color: Colors.white),
                            children: [
                              TextSpan(
                                text: "1",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 25),
                              ),
                              TextSpan(
                                text: "  ВНОСКА",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.screenWidth / 40),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 1, color: Colors.white),
                      ),
                      onPressed: () {},
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                                fontFamily: "Bebas Neue", color: Colors.white),
                            children: [
                              TextSpan(
                                text: "2",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 25),
                              ),
                              TextSpan(
                                text: "  ВНОСКИ",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.screenWidth / 40),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 1, color: Colors.white),
                      ),
                      onPressed: () {},
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                                fontFamily: "Bebas Neue", color: Colors.white),
                            children: [
                              TextSpan(
                                text: "4",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 25),
                              ),
                              TextSpan(
                                text: "  ВНОСКИ",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
              ResponsiveWidget.isSmallScreen(context)
                  ? Container()
                  : Flexible(
                      child: Align(
                          alignment: Alignment.bottomCenter, child: Footer()),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
