import 'package:flutter/material.dart';

//class to show bullets=================//
class MyBullet extends StatelessWidget {
  const MyBullet({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      width: 20.0,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
