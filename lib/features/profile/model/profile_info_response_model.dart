import 'dart:convert';

class ProfileInfoResponseModel {
  String? email;
  String? role;
  String? id;
  String? name;

  ProfileInfoResponseModel({this.email, this.role, this.id, this.name});

  factory ProfileInfoResponseModel.fromRawJson(String str) =>
      ProfileInfoResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      ProfileInfoResponseModel(
        email: json["email"],
        role: json["role"],
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
    "email": email,
    "role": role,
    "id": id,
    "name": name,
  };
}
