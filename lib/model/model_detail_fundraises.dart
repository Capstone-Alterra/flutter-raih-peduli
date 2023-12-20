class ModelDetailFundraises {
  Data data;
  String message;

  ModelDetailFundraises({
    required this.data,
    required this.message,
  });

  factory ModelDetailFundraises.fromJson(Map<String, dynamic> json) =>
      ModelDetailFundraises(
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  int id;
  String title;
  String description;
  String photo;
  int target;
  int fundAcquired;
  DateTime startDate;
  DateTime endDate;
  String status;
  String rejectedReason;
  int userId;
  String userFullname;
  String userPhoto;
  dynamic bookmarkId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Data({
    required this.id,
    required this.title,
    required this.description,
    required this.photo,
    required this.target,
    required this.fundAcquired,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.rejectedReason,
    required this.userId,
    required this.userFullname,
    required this.userPhoto,
    required this.bookmarkId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        photo: json["photo"],
        target: json["target"],
        fundAcquired: json["fund_acquired"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        status: json["status"],
        rejectedReason: json["rejected_reason"],
        userId: json["user_id"],
        userFullname: json["user_fullname"],
        userPhoto: json["user_photo"],
        bookmarkId: json["bookmark_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "photo": photo,
        "target": target,
        "fund_acquired": fundAcquired,
        "start_date": startDate.toIso8601String(),
        "end_date": endDate.toIso8601String(),
        "status": status,
        "rejected_reason": rejectedReason,
        "user_id": userId,
        "user_fullname": userFullname,
        "user_photo": userPhoto,
        "bookmark_id": bookmarkId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
