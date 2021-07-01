import 'enums.dart';

class Exercise {
  String name;
  int reps;
  int sets;
  bool timed;
  int duration;
  Target target;

  Exercise(
      {this.name,
      this.reps,
      this.sets,
      this.timed,
      this.duration,
      this.target});
}
