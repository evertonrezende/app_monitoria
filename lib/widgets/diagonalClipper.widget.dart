import 'package:flutter/material.dart';

class DialogonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0, size.height - 120);
    path.quadraticBezierTo(
        size.width / 4, size.height - 90, size.width / 2, size.height - 120);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height - 120);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
