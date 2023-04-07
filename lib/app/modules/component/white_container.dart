import 'package:flutter/material.dart';

class WhiteContainer extends StatelessWidget {
  const WhiteContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      color: Colors.white,
    );
  }
}
