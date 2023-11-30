class RootModelFundraising {
    final List<ModelFundraising>? data;
    final String? message;
    final Pagination? pagination;

    RootModelFundraising({
        this.data,
        this.message,
        this.pagination,
    });

    factory RootModelFundraising.fromJson(Map<String, dynamic> json) => RootModelFundraising(
        data: json["data"] == null ? [] : List<ModelFundraising>.from(json["data"]!.map((x) => ModelFundraising.fromJson(x))),
        message: json["message"],
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "pagination": pagination?.toJson(),
    };
}

class ModelFundraising {
    final int? id;
    final int? userId;
    final String? title;
    final String? description;
    final String? photo;
    final String? status;
    final int? target;
    final String? startDate;
    final String? endDate;
    final DateTime? createdAt;
    final dynamic updatedAt;
    final dynamic deletedAt;

    ModelFundraising({
        this.id,
        this.userId,
        this.title,
        this.description,
        this.photo,
        this.status,
        this.target,
        this.startDate,
        this.endDate,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory ModelFundraising.fromJson(Map<String, dynamic> json) => ModelFundraising(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        description: json["description"],
        photo: json["photo"],
        status: json["status"],
        target: json["target"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "description": description,
        "photo": photo,
        "status": status,
        "target": target,
        "start_date": startDate,
        "end_date": endDate,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
    };
}

class Pagination {
    final String? totalData;
    final String? currentPage;
    final String? previousPage;
    final String? nextPage;
    final String? totalPage;

    Pagination({
        this.totalData,
        this.currentPage,
        this.previousPage,
        this.nextPage,
        this.totalPage,
    });

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        totalData: json["total_data"],
        currentPage: json["current_page"],
        previousPage: json["previous_page"],
        nextPage: json["next_page"],
        totalPage: json["total_page"],
    );

    Map<String, dynamic> toJson() => {
        "total_data": totalData,
        "current_page": currentPage,
        "previous_page": previousPage,
        "next_page": nextPage,
        "total_page": totalPage,
    };
}
