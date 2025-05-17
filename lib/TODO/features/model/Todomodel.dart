class Todo_model {
  final String name;
  final String place;
  final String? id;
  Todo_model({required this.id, required this.name, required this.place});
  Map<String, dynamic> toMap() {
    return {"id": id, "place": place, "name": name};
  }

  factory Todo_model.fromMap(Map<String, dynamic> json) {
    return Todo_model(id: json["id"], name: json["name"], place: json["place"]);
  }
}
