import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout/models/palette.dart';
import 'package:workout/states/nav_state.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
        color: Colors.white,
      ),
      child: Consumer<NavState>(
        builder: (context, state, _) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _PageWidget(
              Icon(
                Icons.home,
                color: state.index == 0
                    ? Palette().greySelected
                    : Palette().greyUnselected,
              ),
              () => state.changePage(0),
            ),
            _PageWidget(
              Icon(
                Icons.fitness_center,
                color: state.index == 1
                    ? Palette().greySelected
                    : Palette().greyUnselected,
              ),
              () => state.changePage(1),
            ),
            _PageWidget(
              Icon(
                Icons.layers,
                color: state.index == 2
                    ? Palette().greySelected
                    : Palette().greyUnselected,
              ),
              () => state.changePage(2),
            ),
            _PageWidget(
              Icon(
                Icons.account_circle,
                color: state.index == 3
                    ? Palette().greySelected
                    : Palette().greyUnselected,
              ),
              () => state.changePage(3),
            ),
          ],
        ),
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
    return IconButton(
        icon: icona,
        onPressed: strada,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent);
  }
}
