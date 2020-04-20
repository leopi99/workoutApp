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
      done: false,
    ),
    Exercise(
      description: '4 serie da 10',
      name: 'Manubrio',
      weekDays: [2, 6],
      from: '11:00',
      to: '11:30',
      done: false,
    ),
    Exercise(
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vitae lobortis arcu. Praesent pretium nisl tortor, sit amet semper ipsum eleifend eget. Vivamus eu porta lectus, non porta eros. Nullam bibendum eget libero eget tempus. Sed pharetra nibh non metus sodales, iaculis dignissim massa pretium. Nunc sit amet dolor pulvinar, ornare massa eget, malesuada lorem. In rutrum, sapien et lobortis venenatis, purus lorem porttitor lorem, sit amet dictum metus nunc quis ante. Nunc efficitur, nisi sed ullamcorper placerat, purus dolor mattis orci, ut posuere enim lorem id risus. Ut dapibus porttitor lorem, in commodo libero mattis at. Curabitur vitae luctus velit. Pellentesque non feugiat urna. Sed sollicitudin mauris sapien, et volutpat velit fermentum id. Morbi mattis purus at feugiat fermentum. Integer rutrum diam tortor, vel pharetra felis iaculis id. Lorem ipsum dolor sit amet, consectetur adipiscing elit.Nam id neque placerat orci ultricies semper. Vivamus feugiat nisi ut nibh pellentesque, ut viverra metus consectetur. Pellentesque et lacus varius, lacinia nisi eu, aliquam mauris. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas semper lorem vel tristique euismod. Quisque porttitor molestie libero ac congue. Nullam facilisis libero non purus porta malesuada. Fusce lacinia non leo eget sollicitudin. Etiam rhoncus ante vel nulla bibendum maximus. Etiam dignissim auctor dolor et vulputate. Aenean ex velit, vestibulum eget eros in, auctor interdum velit. Sed vitae aliquet lorem. Pellentesque nisi tortor, eleifend vitae facilisis ut, lobortis nec magna. Etiam at nisi eu felis venenatis hendrerit eu sed enim. Nulla in bibendum metus. Etiam fringilla tincidunt neque, vitae finibus lectus fermentum vitae.Aliquam pellentesque interdum dui, non porttitor metus sagittis a. Sed non porta mauris, nec mollis nisl. Curabitur cursus ex sem. Duis bibendum auctor sem ut porttitor. Praesent vel tincidunt nulla, sit amet efficitur mauris. Donec quis urna euismod, dapibus sapien sed, finibus nisi. Integer ante justo, ultricies eu neque sed, luctus commodo arcu. Sed ultricies sollicitudin laoreet.Praesent fringilla sit amet ipsum non fermentum. Ut mollis, dolor sit amet laoreet laoreet, arcu lacus volutpat ex, ac semper lorem erat a purus. Donec orci eros, pretium ac hendrerit ac, finibus eu ante. Nunc commodo efficitur nibh quis fermentum. Nullam non odio lorem. Aenean vel velit feugiat, aliquam purus ut, pellentesque lectus. Duis sit amet consequat arcu, a porttitor quam.Nam at convallis metus. In tempus, dui sed tincidunt dignissim, massa erat efficitur leo, vel dapibus orci lectus non quam. Sed ut facilisis velit. Donec commodo quam nisi, vel condimentum turpis vulputate a. Pellentesque lacinia elit in urna pretium, in maximus felis maximus. Integer eu dolor eu enim placerat porta et sed turpis. Integer arcu nisi, vestibulum nec dui nec, vehicula efficitur metus. Ut vitae consequat eros. Praesent ultrices condimentum risus. Morbi ultrices, tellus a semper scelerisque, tellus nulla euismod augue, at fermentum nunc libero eu est. Sed ut diam purus. Ut eget bibendum sem.',
      name: ' Esercizio per il test del testo bididibodidibu',
      weekDays: [0, 3],
      from: '01:00',
      to: '11:30',
      done: false,
    ),
  ];

//Sets the done var
  void setDone(Exercise ex) {
    int index = _exercises.indexOf(ex);
    _exercises[index].done = !_exercises[index].done;
    notifyListeners();
  }

//Returns the exercise from an index
  Exercise exerciseat(int index) => _exercises[index];

//Returns the length of the list of exercises
  int get exerciseLength => _exercises.length;

//Adds an exercise to the list
  void addExercise(Exercise exe) {
    _exercises.add(exe);
    notifyListeners();
  }

//Returns the exercises for a defined day
  List<Exercise> exerciseFor(int weekday) => _exercises
      .where((element) => element.weekDays.contains(weekday))
      .toList();
}
