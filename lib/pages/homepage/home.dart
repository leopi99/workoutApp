import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SvgPicture.asset(
          'images/svgs/yoga.svg',
          height: 156.0,
          width: 312.0,
        ),
        SizedBox(height: 16.0),
        Text('Non hai ancora inserito nessun esercizio'),
      ],
    );
  }
}
