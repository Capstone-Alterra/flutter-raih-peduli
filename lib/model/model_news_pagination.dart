class ModelNewsPagination {
  List<Datum> data;
  String message;
  Pagination pagination;

  ModelNewsPagination({
    required this.data,
    required this.message,
    required this.pagination,
  });

  factory ModelNewsPagination.fromJson(Map<String, dynamic> json) =>
      ModelNewsPagination(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
        pagination: Pagination.fromJson(json["pagination"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "data": List<dynamic>.from(data.map((x) => x.toJson())),
  //       "message": message,
  //       "pagination": pagination.toJson(),
  //     };
        void addData(Datum newData) {
    data.add(newData);
  }

  void addAllData(List<Datum> newDataList) {
    data.addAll(newDataList);
  }
}

class Datum {
  int id;
  String title;
  String description;
  String photo;
  int userId;
  dynamic bookmarkId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Datum({
    required this.id,
    required this.title,
    required this.description,
    required this.photo,
    required this.userId,
    required this.bookmarkId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        photo: json["photo"],
        userId: json["user_id"],
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
        "user_id": userId,
        "bookmark_id": bookmarkId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}

class Pagination {
  int totalData;
  int currentPage;
  int nextPage;
  int previousPage;
  int pageSize;
  int totalPage;

  Pagination({
    required this.totalData,
    required this.currentPage,
    required this.nextPage,
    required this.previousPage,
    required this.pageSize,
    required this.totalPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        totalData: json["total_data"],
        currentPage: json["current_page"],
        nextPage: json["next_page"],
        previousPage: json["previous_page"],
        pageSize: json["page_size"],
        totalPage: json["total_page"],
      );

  Map<String, dynamic> toJson() => {
        "total_data": totalData,
        "current_page": currentPage,
        "next_page": nextPage,
        "previous_page": previousPage,
        "page_size": pageSize,
        "total_page": totalPage,
      };
}
