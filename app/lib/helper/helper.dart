import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Helper {
  static goToScreen(BuildContext context,
      {Widget screen, bool replace = false}) {
    if (replace) {
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return screen;
          },
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return screen;
          },
        ),
      );
    }
  }

  static launchURL({String url}) async {
    if (await canLaunch(url)) {
      return launch(url);
    }
  }
}
