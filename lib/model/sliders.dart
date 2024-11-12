import 'dart:convert';

class Sliders {
  final bool? success;
  final List<Slider>? sliders;

  Sliders({
    this.success,
    this.sliders,
  });

  factory Sliders.fromRawJson(String str) => Sliders.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sliders.fromJson(Map<String, dynamic> json) => Sliders(
        success: json["success"],
        sliders: json["sliders"] == null
            ? []
            : List<Slider>.from(
                json["sliders"]!.map((x) => Slider.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "sliders": sliders == null
            ? []
            : List<dynamic>.from(sliders!.map((x) => x.toJson())),
      };
}

class Slider {
  final String? imagePath;
  final String? title;
  final String? id;

  Slider({
    this.imagePath,
    this.title,
    this.id,
  });

  factory Slider.fromRawJson(String str) => Slider.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
        imagePath: json["imagePath"],
        title: json["title"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "imagePath": imagePath,
        "title": title,
        "_id": id,
      };
}
