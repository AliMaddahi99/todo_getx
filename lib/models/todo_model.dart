class TodoModel {
  int id;
  String title;
  bool isDone;

  TodoModel({
    required this.id,
    required this.title,
    this.isDone = false,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      TodoModel(id: json["id"], title: json["title"], isDone: json["isDone"]);

  Map<String, dynamic> toJson() => {"id": id, "title": title, "isDone": isDone};
}
