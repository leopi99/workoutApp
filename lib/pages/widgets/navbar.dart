import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(28),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _PageWidget(
            Icon(
              Icons.home,
              color: Colors.grey[400],
            ),
            () {},
          ),
          _PageWidget(
            Icon(
              Icons.account_circle,
              color: Colors.grey[400],
            ),
            () {},
          ),
        ],
      ),
    );
  }
}

class _PageWidget extends StatelessWidget {
  final Icon icona;
  final Function strada;
  _PageWidget(this.icona, this.strada);

  @override
  Widget build(BuildContext context) {
    return IconButton(icon: icona, onPressed: strada);
  }
}
