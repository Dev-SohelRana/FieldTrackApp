import 'dart:convert';

class GetLocationsResponseModel {
  List<Datum>? data;

  GetLocationsResponseModel({this.data});

  factory GetLocationsResponseModel.fromRawJson(String str) =>
      GetLocationsResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetLocationsResponseModel.fromJson(Map<String, dynamic> json) =>
      GetLocationsResponseModel(
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
  String? locationName;
  double? latitude;
  double? longitude;
  int? radiusM;
  bool? isActive;
  String? id;

  Datum({
    this.locationName,
    this.latitude,
    this.longitude,
    this.radiusM,
    this.isActive,
    this.id,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    locationName: json["location_name"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    radiusM: json["radius_m"],
    isActive: json["is_active"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "location_name": locationName,
    "latitude": latitude,
    "longitude": longitude,
    "radius_m": radiusM,
    "is_active": isActive,
    "id": id,
  };
}
