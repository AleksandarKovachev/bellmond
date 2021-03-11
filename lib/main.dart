import 'package:bellmond/home_page.dart';
import 'package:bellmond/routes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bellmond',
      theme: appTheme(),
      builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget),
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(color: Color(0xFF131617))),
      initialRoute: Routes.home,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings settings) {
        return Routes.fadeThrough(
          settings,
          (context) {
            switch (settings.name) {
              case Routes.home:
                return HomePage();
              default:
                return null;
            }
          },
        );
      },
    );
  }

  ThemeData appTheme() {
    return ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      canvasColor: Color(0xFF202126),
      primaryColor: Color(0xFF131617),
      backgroundColor: Color(0xFF131617),
      scaffoldBackgroundColor: Color(0xFF131617),
      accentColor: Color(0xFF00ADEE),
      applyElevationOverlayColor: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
