class Exercise {
  String name;
  String description;
  List<int>
      weekDays; //Day or Days of the week when the user want to do that exercise
  String from, to;

  Exercise({
    this.weekDays,
    this.description,
    this.from,
    this.to,
    this.name,
  });
}
