import 'package:bellmond/core/util/size_config.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  Footer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: Theme.of(context).canvasColor,
      width: SizeConfig.screenWidth,
      height: 100,
      child: Center(
        child: Image.asset(
          "assets/images/bellmond_footer.png",
          height: 50,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
