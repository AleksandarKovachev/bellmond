import 'package:bellmond/core/card_navigation.dart';
import 'package:bellmond/core/drawer_navigation.dart';
import 'package:bellmond/core/home_card.dart';
import 'package:bellmond/core/top_bar_contents.dart';
import 'package:bellmond/core/widget/responsive_widget.dart';
import 'package:bellmond/footer.dart';
import 'package:flutter/material.dart';

import 'core/util/size_config.dart';

class HomePage extends StatefulWidget {
  final List<CardNavigation> cardNavigationList;

  HomePage(this.cardNavigationList);

  @override
  HomePageState createState() => HomePageState(cardNavigationList);
}

class HomePageState extends State<HomePage> {
  final List<CardNavigation> cardNavigationList;
  ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  HomePageState(this.cardNavigationList);

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    _opacity = _scrollPosition < SizeConfig.screenHeight * 1
        ? _scrollPosition / (SizeConfig.screenHeight * 1)
        : 1;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor:
                  Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
              elevation: 0,
            )
          : PreferredSize(
              preferredSize: Size(SizeConfig.screenWidth, 150),
              child: TopBarContents(_opacity),
            ),
      drawer: SafeArea(
        child: DrawerNavigation(),
      ),
      body: Container(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset('assets/images/home_image.png'),
                  ResponsiveWidget.isSmallScreen(context)
                      ? Container()
                      : Container(
                          padding: EdgeInsets.only(top: 200),
                          width: 150,
                          height: SizeConfig.screenWidth / 2,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/instagram.png",
                                        width: SizeConfig.screenWidth / 50,
                                      ),
                                      SizedBox(
                                          height: SizeConfig.screenWidth / 20),
                                      Image.asset(
                                        "assets/images/pinterest.png",
                                        width: SizeConfig.screenWidth / 50,
                                      ),
                                      SizedBox(
                                          height: SizeConfig.screenWidth / 20),
                                      Image.asset(
                                        "assets/images/facebook.png",
                                        width: SizeConfig.screenWidth / 50,
                                      ),
                                      SizedBox(
                                          height: SizeConfig.screenWidth / 20),
                                      Image.asset(
                                        "assets/images/linkedin.png",
                                        width: SizeConfig.screenWidth / 50,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: Container(
                                    width: 1,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                  Container(
                    margin: EdgeInsets.only(
                        top: (ResponsiveWidget.isSmallScreen(context)
                            ? SizeConfig.screenWidth / 10
                            : 200),
                        left: (ResponsiveWidget.isSmallScreen(context)
                                ? 0
                                : 150) +
                            SizeConfig.screenWidth / 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                                fontFamily: "Raleway",
                                color: Color(0xFF00ADF1),
                                fontSize: SizeConfig.defaultSize),
                            children: [
                              TextSpan(
                                text: "ЗАСТРАХОВАЙ",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              TextSpan(
                                text: " СЕ ",
                              ),
                              TextSpan(
                                text: "СЕГА",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: SizeConfig.screenWidth / 40),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                color: Colors.white,
                                fontSize: 40),
                            children: [
                              TextSpan(
                                text: "Protecting",
                              ),
                              TextSpan(
                                text: " your ",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              TextSpan(
                                text: "future",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: SizeConfig.screenWidth / 20),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(width: 1, color: Colors.white),
                          ),
                          onPressed: () {},
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "СВЪРЖИ се с нас",
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
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.screenWidth / 20),
              Container(
                margin: EdgeInsets.only(
                    left: (ResponsiveWidget.isSmallScreen(context) ? 0 : 150) +
                        SizeConfig.screenWidth / 20,
                    right: SizeConfig.screenWidth / 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Онлайн застраховки",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna",
                      style: TextStyle(
                        fontFamily: "Roboto Slab",
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    GridView.count(
                      crossAxisCount:
                          ResponsiveWidget.isSmallScreen(context) ? 2 : 3,
                      shrinkWrap: true,
                      crossAxisSpacing: SizeConfig.screenWidth / 60,
                      mainAxisSpacing: SizeConfig.screenWidth / 60,
                      physics: NeverScrollableScrollPhysics(),
                      children: List.generate(
                        cardNavigationList.length,
                        (index) {
                          return HomeCard(
                              cardNavigation: cardNavigationList[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 200),
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
