import 'package:flutter/material.dart';
import 'package:khetipoint_assignment/services/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class OpeningScreen extends StatefulWidget {
  static const String id = "OpeningScreen";
  @override
  _OpeningScreenState createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
  bool showSpinner = false;

  @override
  void initState() {
    //fetchItemList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 250,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    FaIcon(FontAwesomeIcons.leaf,
                        size: 80, color: Colors.green),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Kheti',
                          style: TextStyle(
                              fontSize: 40,
                              fontFamily: 'Pacifico', //'JockeyOne',
                              color: Colors.green),
                        ),
                        Text(
                          'Point',
                          style: TextStyle(
                              fontSize: 40,
                              fontFamily: 'Pacifico', //'JockeyOne',
                              color: Colors.black87),
                        ),
                      ],
                    ),
                    Text(
                      'GitHub Trending Repos',
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'OpenSans',
                          color: Colors.black87),
                    ),
                  ],
                ),
              ),
              showSpinner
                  ? SpinKitThreeBounce(
                      color: kThemeColor,
                      size: 40,
                    )
                  : SizedBox(
                      height: 40,
                    ),
              FlatButton(
                  onPressed: () async {},
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.green),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.wpexplorer,
                            size: 30, color: Colors.white),
                        Text(
                          '  Explore',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  )),
            ],
          )),
    ));
  }
}
