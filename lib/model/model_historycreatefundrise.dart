import 'dart:convert';

HistoryCreateFundrise historyCreateFundriseFromJson(Map<String, dynamic>map) =>
    HistoryCreateFundrise.fromJson(map);

String historyCreateFundriseToJson(HistoryCreateFundrise data) =>
    json.encode(data.toJson());

class HistoryCreateFundrise {
  final List<Datum> data;
  final String message;

  HistoryCreateFundrise({
    required this.data,
    required this.message,
  });

  factory HistoryCreateFundrise.fromJson(Map<String, dynamic> json) =>
      HistoryCreateFundrise(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  final int id;
  final String title;
  final String description;
  final String photo;
  final int target;
  final int fundAcquired;
  final DateTime startDate;
  final DateTime endDate;
  final String status;
  final String rejectedReason;
  final int userId;
  final dynamic bookmarkId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;
  final String postType;

  Datum({
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
    required this.bookmarkId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.postType,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
        bookmarkId: json["bookmark_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        postType: json["post_type"],
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
        "bookmark_id": bookmarkId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "post_type": postType,
      };
}
