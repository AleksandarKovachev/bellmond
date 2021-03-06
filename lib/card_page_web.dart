import 'package:bellmond/core/card_navigation.dart';
import 'package:bellmond/core/util/size_config.dart';
import 'package:bellmond/core/widget/responsive_widget.dart';
import 'package:bellmond/footer.dart';
import 'package:bellmond/payment_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardPageWeb extends StatefulWidget {
  final CardNavigation cardNavigation;

  const CardPageWeb({Key key, this.cardNavigation}) : super(key: key);

  @override
  CardPageWebState createState() => CardPageWebState(cardNavigation: cardNavigation);
}

class CardPageWebState extends State<CardPageWeb> {
  final CardNavigation cardNavigation;

  CardPageWebState({Key key, this.cardNavigation});

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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: SizeConfig.screenWidth / 20,
                    left: (ResponsiveWidget.isSmallScreen(context) ? 0 : 150) +
                        SizeConfig.screenWidth / 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ЗАСТРАХОВКА",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "КАСКО",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w900,
                              fontSize: 30),
                        ),
                        SizedBox(height: SizeConfig.screenWidth / 20),
                        SizedBox(
                          width: 350,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFF202126),
                              border: InputBorder.none,
                              hintText: 'Номер на талон',
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.screenWidth / 60),
                        SizedBox(
                          width: 350,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFF202126),
                              border: InputBorder.none,
                              hintText: 'Регистрационен номер',
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.screenWidth / 20),
                        OutlinedButton(
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
                      ],
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: Hero(
                          tag: cardNavigation.title,
                          child: Image.asset(
                            cardNavigation.image,
                            scale: 1.5,
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
