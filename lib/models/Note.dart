class Note{
  String title;
  String description;

  Note(this.title, this.description);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }
}