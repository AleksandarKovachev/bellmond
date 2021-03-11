import 'package:bellmond/card_page.dart';
import 'package:bellmond/core/card_navigation.dart';
import 'package:bellmond/core/util/size_config.dart';
import 'package:bellmond/core/widget/responsive_widget.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final CardNavigation cardNavigation;

  HomeCard({Key key, this.cardNavigation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CardPage(cardNavigation: cardNavigation),
            ),
          );
        },
        child: Hero(
          tag: cardNavigation.title,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF202126).withAlpha(1), Color(0xFF202126)]),
              image: DecorationImage(
                fit: BoxFit.scaleDown,
                alignment: AlignmentDirectional.bottomEnd,
                image: AssetImage(
                  cardNavigation.image,
                ),
              ),
            ),
            child: Container(
              margin: EdgeInsets.all(
                SizeConfig.getProportionateScreenWidth(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 2,
                    width: SizeConfig.screenWidth / 20,
                    color: Colors.white,
                  ),
                  Text(
                    cardNavigation.title,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700,
                      fontSize: ResponsiveWidget.isSmallScreen(context) ||
                              ResponsiveWidget.isMediumScreen(context)
                          ? 18
                          : SizeConfig.screenWidth / 50,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
