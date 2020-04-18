import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout/models/exercise.dart';
import 'package:workout/models/palette.dart';
import 'package:workout/states/exercise_state.dart';

class ExerciseWidget extends StatelessWidget {
  final Exercise exercise;
  ExerciseWidget(this.exercise);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: 92,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Consumer<ExerciseState>(
            builder: (context, state, _) => Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Palette().greyUnselected,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  margin: EdgeInsets.only(right: 14),
                  width: 2,
                  height: double.infinity,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      exercise.name,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 6.0),
                      child: Text(
                        exercise.description.substring(
                                0,
                                exercise.description.length > 20
                                    ? 20
                                    : exercise.description.length) +
                            '${exercise.description.length > 20 ? "..." : ""}',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
