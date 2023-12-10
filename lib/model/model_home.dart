class ModelHome {
  Data data;
  String message;

  ModelHome({
    required this.data,
    required this.message,
  });

  factory ModelHome.fromJson(Map<String, dynamic> json) => ModelHome(
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  List<Fundraise> fundraise;
  List<Fundraise> volunteer;
  List<Fundraise> news;

  Data({
    required this.fundraise,
    required this.volunteer,
    required this.news,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        fundraise: List<Fundraise>.from(
            json["fundraise"].map((x) => Fundraise.fromJson(x))),
        volunteer: List<Fundraise>.from(
            json["volunteer"].map((x) => Fundraise.fromJson(x))),
        news: List<Fundraise>.from(
            json["news"].map((x) => Fundraise.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "fundraise": List<dynamic>.from(fundraise.map((x) => x.toJson())),
        "volunteer": List<dynamic>.from(volunteer.map((x) => x.toJson())),
        "news": List<dynamic>.from(news.map((x) => x.toJson())),
      };
}

class Fundraise {
  int id;
  String title;
  String description;
  String photo;
  int? target;
  int? numberOfVacancies;

  Fundraise({
    required this.id,
    required this.title,
    required this.description,
    required this.photo,
    this.target,
    this.numberOfVacancies,
  });

  factory Fundraise.fromJson(Map<String, dynamic> json) => Fundraise(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        photo: json["photo"],
        target: json["target"],
        numberOfVacancies: json["number_of_vacancies"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "photo": photo,
        "target": target,
        "number_of_vacancies": numberOfVacancies,
      };
}
