class Task {
  Task({required this.description});

  String description;
  bool isDone = false;

  void toggleDone() {
    isDone = !isDone;
  }
}
