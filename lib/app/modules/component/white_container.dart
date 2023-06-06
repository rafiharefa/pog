import 'package:flutter/material.dart';

import '../../../data/variable.dart';

class WhiteContainer extends StatelessWidget {
  const WhiteContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      // color: Colors.white,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(Gvar.card_bg_2))),
    );
  }
}
