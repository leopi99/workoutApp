import 'package:flutter/foundation.dart';
import 'package:workout/models/exercise.dart';

class ExerciseState with ChangeNotifier {
  List<Exercise> _exercises = [
    Exercise(
      description: '4 serie di flessioni da 10',
      name: 'Piegamenti',
      weekDays: [0, 1, 2, 3, 4, 5, 6],
      from: '10:00',
      to: '10:30',
    ),
  ];

  void addExercise(Exercise exe) {
    _exercises.add(exe);
    notifyListeners();
  }

  List<Exercise> get todayExercises => _exercises
      .where((element) => element.weekDays.contains(DateTime.now().weekday))
      .toList();
}
