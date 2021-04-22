import 'package:flutter/material.dart';
import 'package:khetipoint_assignment/services/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khetipoint_assignment/services/item_fetcher.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Trending'),
        ),
        body: null,
      ),
    );
  }
}
