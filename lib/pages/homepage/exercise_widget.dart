import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:workout/models/exercise.dart';
import 'package:workout/models/palette.dart';

import 'package:workout/pages/exercise_page/exercise_page.dart';

import 'package:workout/states/exercise_state.dart';

class ExerciseWidget extends StatelessWidget {
  final Exercise exercise;
  ExerciseWidget(this.exercise);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ExercisePage(exercise: exercise))),
      child: Material(
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
                        '${exercise.name.length > 30 ? exercise.name.substring(0, 30) + "..." : exercise.name}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 6.0),
                        child: Text(
                          '${exercise.description.length > 30 ? exercise.description.substring(0, 30) + "..." : exercise.description}',
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
      ),
    );
  }
}
