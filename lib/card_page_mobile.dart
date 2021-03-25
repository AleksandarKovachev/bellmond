import 'package:bellmond/core/card_navigation.dart';
import 'package:bellmond/core/util/size_config.dart';
import 'package:bellmond/core/widget/responsive_widget.dart';
import 'package:bellmond/payment_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardPageMobile extends StatefulWidget {
  final CardNavigation cardNavigation;

  const CardPageMobile({Key key, this.cardNavigation}) : super(key: key);

  @override
  CardPageState createState() => CardPageState(cardNavigation: cardNavigation);
}

class CardPageState extends State<CardPageMobile> {
  final CardNavigation cardNavigation;

  CardPageState({Key key, this.cardNavigation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            )
          : PreferredSize(
              preferredSize: Size(SizeConfig.screenWidth, 150),
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/Bellmond-Insurance.png'),
                    SizedBox(width: SizeConfig.screenWidth / 20),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            Text(
                              "Изход",
                              style: TextStyle(
                                fontFamily: "Bebas Neue",
                                color: Colors.white,
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: ResponsiveWidget.isSmallScreen(context)
                  ? SizeConfig.screenWidth / 20
                  : 150),
          child: Container(
            margin: EdgeInsets.only(
                top: SizeConfig.screenWidth / 20,
                left: SizeConfig.screenWidth / 20,
                right: SizeConfig.screenWidth / 20),
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
                    "ЗАСТРАХОВКА",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Center(
                  child: Text(
                    "КАСКО",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w900,
                        fontSize: 30),
                  ),
                ),
                SizedBox(height: SizeConfig.screenWidth / 20),
                Center(
                  child: Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFF202126),
                        border: InputBorder.none,
                        hintText: 'Номер на талон',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.screenWidth / 60),
                Center(
                  child: Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFF202126),
                        border: InputBorder.none,
                        hintText: 'Регистрационен номер',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.screenWidth / 20),
                Center(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              PaymentPage(cardNavigation: cardNavigation),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "ПРОДЪЛЖИ",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Bebas Neue",
                              fontSize: 20,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
