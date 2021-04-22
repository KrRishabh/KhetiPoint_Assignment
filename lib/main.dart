import 'package:flutter/material.dart';
import 'package:khetipoint_assignment/screens/opening_screen.dart';

void main() {
  return runApp(KhetiPoint());
}

class KhetiPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KhetiPoint',
      initialRoute: OpeningScreen.id,
      routes: {
        OpeningScreen.id: (context) => OpeningScreen(),
        //ExploreAllScreen.id: (context) => ExploreAllScreen(),
      },
    );
  }
}
