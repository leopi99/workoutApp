import 'package:workout/models/tool.dart';

class Exercise {
  String name;
  String description;
  List<int>
      weekDays; //Day or Days of the week when the user want to do that exercise
  String from, to;
  List<Tool> equipment = [];
  bool done = false;

  Exercise({
    this.weekDays,
    this.description,
    this.from,
    this.to,
    this.name,
    this.equipment,
    this.done,
  });
}
