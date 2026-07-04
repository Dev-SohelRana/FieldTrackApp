import 'dart:convert';

class GetTodosResponseModel {
  List<Datum>? data;

  GetTodosResponseModel({this.data});

  factory GetTodosResponseModel.fromRawJson(String str) =>
      GetTodosResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetTodosResponseModel.fromJson(Map<String, dynamic> json) =>
      GetTodosResponseModel(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? title;
  String? description;
  bool? isCompleted;
  DateTime? dueAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? id;

  Datum({
    this.title,
    this.description,
    this.isCompleted,
    this.dueAt,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    title: json["title"],
    description: json["description"],
    isCompleted: json["is_completed"],
    dueAt: json["due_at"] == null ? null : DateTime.parse(json["due_at"]),
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "is_completed": isCompleted,
    "due_at": dueAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "id": id,
  };
}
