class FoodModel {
  final String uid;
  final String name;
  final String id;
  final bool isSuyuq;
  final bool isXamirli;
  final bool isParhezli;
  final bool isPishiriq;
  final bool isFasfood;
  final bool isMilliy;
  final bool isWorld;
  final String description;
  final List<String> names;
  final List<String> video_urls;
  final List<String> img_urls;
  final List<String> steps;
  final List<String> other_items;
  final List<Map<String, String>> items;
  final String size;
  final String time;
  final List<String> sources;

  FoodModel({
    required this.uid,
    required this.name,
    required this.id,
    required this.isSuyuq,
    required this.isXamirli,
    required this.isParhezli,
    required this.isPishiriq,
    required this.isFasfood,
    required this.isMilliy,
    required this.isWorld,
    required this.description,
    required this.names,
    required this.video_urls,
    required this.img_urls,
    required this.steps,
    required this.other_items,
    required this.items,
    required this.size,
    required this.time,
    required this.sources,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        uid: json['uid'],
        name: json["na  me"],
        id: json["id"],
        isSuyuq: json["isSuyuq"],
        isXamirli: json["isXamirli"],
        isParhezli: json["isParhezli"],
        isPishiriq: json["isPishiriq"],
        isFasfood: json['isFasfood'],
        isMilliy: json["isMilliy"],
        isWorld: json["isWorld"],
        description: json["description"],
        names: json["names"],
        video_urls: json["video_urls"],
        img_urls: json["img_urls"],
        steps: json["steps"],
        other_items: json['other_items'],
        items: json["items"],
        size: json["size"],
        time: json["time"],
        sources: json['sources'],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "id": id,
        "isSuyuq": isSuyuq,
        "isXamirli": isXamirli,
        "isParhezli": isParhezli,
        "isPishiriq": isPishiriq,
        "isFasfood": isFasfood,
        "isMilliy": isMilliy,
        "isWorld": isWorld,
        "description": description,
        "names": names,
        "video_urls": video_urls,
        "img_urls": img_urls,
        "steps": steps,
        "other_items": other_items,
        "items": items,
        "size": size,
        "time": time,
        "sources": sources
      };
}
