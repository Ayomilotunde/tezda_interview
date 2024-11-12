import 'dart:convert';

class PickupLocations {
  final bool? success;
  final List<Location>? locations;

  PickupLocations({
    this.success,
    this.locations,
  });

  factory PickupLocations.fromRawJson(String str) => PickupLocations.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PickupLocations.fromJson(Map<String, dynamic> json) => PickupLocations(
    success: json["success"],
    locations: json["locations"] == null ? [] : List<Location>.from(json["locations"]!.map((x) => Location.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "locations": locations == null ? [] : List<dynamic>.from(locations!.map((x) => x.toJson())),
  };
}

class Location {
  final String? state;
  final String? lga;
  final String? address;
  final String? description;
  final String? id;

  Location({
    this.state,
    this.lga,
    this.address,
    this.description,
    this.id,
  });

  factory Location.fromRawJson(String str) => Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    state: json["state"],
    lga: json["lga"],
    address: json["address"],
    description: json["description"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "state": state,
    "lga": lga,
    "address": address,
    "description": description,
    "_id": id,
  };
}
