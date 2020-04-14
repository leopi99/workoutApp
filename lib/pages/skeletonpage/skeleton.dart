import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workout/pages/homepage/home.dart';
import 'package:workout/pages/widgets/navbar.dart';

List<Widget> _pages = [
  Homepage(),
];

class SkeletonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Il tuo personal trainer'),
            SizedBox(height: 8.0),
            SvgPicture.asset(
              'images/svgs/personal_trainer.svg',
              height: 156.0,
              width: 312.0,
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
