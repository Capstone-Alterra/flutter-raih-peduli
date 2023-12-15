class ModelBookmark {
  Data data;
  String message;

  ModelBookmark({
    required this.data,
    required this.message,
  });

  factory ModelBookmark.fromJson(Map<String, dynamic> json) => ModelBookmark(
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
  List<News> news;
  List<Vacancy> vacancy;

  Data({
    required this.fundraise,
    required this.news,
    required this.vacancy,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        fundraise: List<Fundraise>.from(
            json["fundraise"].map((x) => Fundraise.fromJson(x))),
        news: List<News>.from(json["news"].map((x) => News.fromJson(x))),
        vacancy:
            List<Vacancy>.from(json["vacancy"].map((x) => Vacancy.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "fundraise": List<Fundraise>.from(fundraise!.map((x) => x.toJson())),
        "news": List<News>.from(news!.map((x) => x.toJson())),
        "vacancy": List<Vacancy>.from(vacancy!.map((x) => x.toJson())),
      };
}

class Fundraise {
  String bookmarkId;
  int postId;
  String title;
  String description;
  String photo;
  int target;
  DateTime startDate;
  DateTime endDate;
  String status;

  Fundraise({
    required this.bookmarkId,
    required this.postId,
    required this.title,
    required this.description,
    required this.photo,
    required this.target,
    required this.startDate,
    required this.endDate,
    required this.status,
  });

  factory Fundraise.fromJson(Map<String, dynamic> json) => Fundraise(
        bookmarkId: json["bookmark_id"],
        postId: json["post_id"],
        title: json["title"],
        description: json["description"],
        photo: json["photo"],
        target: json["target"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "bookmark_id": bookmarkId,
        "post_id": postId,
        "title": title,
        "description": description,
        "photo": photo,
        "target": target,
        "start_date": startDate.toIso8601String(),
        "end_date": endDate.toIso8601String(),
        "status": status,
      };
}

class News {
  String bookmarkId;
  int postId;
  String title;
  String description;
  String photo;

  News({
    required this.bookmarkId,
    required this.postId,
    required this.title,
    required this.description,
    required this.photo,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
        bookmarkId: json["bookmark_id"],
        postId: json["post_id"],
        title: json["title"],
        description: json["description"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "bookmark_id": bookmarkId,
        "post_id": postId,
        "title": title,
        "description": description,
        "photo": photo,
      };
}

class Vacancy {
  String bookmarkId;
  int postId;
  String title;
  String description;
  String skillsRequred;
  int numberOfVacancies;
  DateTime applicationDeadline;
  String contactEmail;
  String province;
  String city;
  String subDistrict;
  String photo;

  Vacancy({
    required this.bookmarkId,
    required this.postId,
    required this.title,
    required this.description,
    required this.skillsRequred,
    required this.numberOfVacancies,
    required this.applicationDeadline,
    required this.contactEmail,
    required this.province,
    required this.city,
    required this.subDistrict,
    required this.photo,
  });

  factory Vacancy.fromJson(Map<String, dynamic> json) => Vacancy(
        bookmarkId: json["bookmark_id"] ,
        postId: json["post_id"],
        title: json["title"],
        description: json["description"],
        skillsRequred: json["skills_requred"],
        numberOfVacancies: json["number_of_vacancies"],
        applicationDeadline: DateTime.parse(json["application_deadline"]),
        contactEmail: json["contact_email"],
        province: json["province"],
        city: json["city"],
        subDistrict: json["sub_district"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "bookmark_id": bookmarkId,
        "post_id": postId,
        "title": title,
        "description": description,
        "skills_requred": skillsRequred,
        "number_of_vacancies": numberOfVacancies,
        "application_deadline": applicationDeadline.toIso8601String(),
        "contact_email": contactEmail,
        "province": province,
        "city": city,
        "sub_district": subDistrict,
        "photo": photo,
      };
}
