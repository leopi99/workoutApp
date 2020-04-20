import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout/models/exercise.dart';
import 'package:workout/states/exercise_state.dart';

class AllExercises extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            'Esercizi',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        Consumer<ExerciseState>(
          builder: (context, state, _) => ListView.builder(
            shrinkWrap: true,
            itemCount: state.exerciseLength,
            padding: EdgeInsets.all(8).copyWith(top: 24),
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: _ExerciseWidget(
                exercise: state.exerciseat(index),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ExerciseWidget extends StatelessWidget {
  final Exercise exercise;

  _ExerciseWidget({
    @required this.exercise,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Text('${exercise.name}'),
        ],
      ),
    );
  }
}
