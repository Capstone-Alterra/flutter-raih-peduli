import 'dart:convert';

ListSkill listSkillFromJson(String str) => ListSkill.fromJson(json.decode(str));

String listSkillToJson(ListSkill data) => json.encode(data.toJson());

class ListSkill {
    List<Datum> data;
    String message;

    ListSkill({
        required this.data,
        required this.message,
    });

    factory ListSkill.fromJson(Map<String, dynamic> json) => ListSkill(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };

  take(int i) {}
}

class Datum {
    int id;
    String name;

    Datum({
        required this.id,
        required this.name,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
