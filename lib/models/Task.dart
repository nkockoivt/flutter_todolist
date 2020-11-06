class Task {
  String title;
  String description;
  String color;
  DateTime time;

  Task(this.title, this.description, this.color, this.time);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'color': color,
      'datetime': time,
    };
  }
}
