import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:workout/states/exercise_state.dart';

//  Page with all the exercises to do today

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ExerciseState>(
      builder: (context, state, _) => state.todayExercises.length == 0
          ? Column(
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
            )
          : ListView(
              children: [
                Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                                'Oggi ${DateTime.now().day}/${DateTime.now().month}'),
                          ],
                        ),
                        Row(),
                      ],
                    ),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => _ExerciseWidget(index),
                  itemCount: state.todayExercises.length,
                ),
              ],
            ),
    );
  }
}

class _ExerciseWidget extends StatelessWidget {
  final int _exerciseIndex;
  _ExerciseWidget(this._exerciseIndex);
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: Row(),
    );
  }
}
