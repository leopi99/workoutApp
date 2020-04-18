import 'package:flutter/foundation.dart';
import 'package:workout/models/exercise.dart';

class ExerciseState with ChangeNotifier {
  List<Exercise> _exercises = [
    Exercise(
      description: '4 serie di flessioni da 10',
      name: 'Piegamenti',
      weekDays: [5],
      from: '10:00',
      to: '10:30',
    ),
    Exercise(
      description: '4 serie da 10',
      name: 'Manubrio',
      weekDays: [2, 6],
      from: '11:00',
      to: '11:30',
    ),
  ];

  void addExercise(Exercise exe) {
    _exercises.add(exe);
    notifyListeners();
  }

//Returns the exercises for a defined day
  List<Exercise> exerciseFor(int weekday) => _exercises
      .where((element) => element.weekDays.contains(weekday))
      .toList();
}
