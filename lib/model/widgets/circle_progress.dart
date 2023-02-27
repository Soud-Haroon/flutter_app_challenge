import 'package:flutter/material.dart';


//Widget to show Progress=================//
Widget circleLoader(BuildContext context) {
  return const SizedBox(
    height: 40,
    width: 40,
    child: CircularProgressIndicator.adaptive(
      backgroundColor: Colors.amberAccent,
    ),
  );
}
