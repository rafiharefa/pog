import 'package:flutter/material.dart';

class Content2 extends StatelessWidget {
  const Content2({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: width,
      height: 500,
      child: Center(child: Text('CONTENT 2')),
    );
  }
}