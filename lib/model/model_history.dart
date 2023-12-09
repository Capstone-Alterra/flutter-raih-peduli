// To parse this JSON data, do
//
//     final historyAll = historyAllFromJson(jsonString);

import 'dart:convert';

HistoryAll historyAllFromJson(Map<String, dynamic> map) => HistoryAll.fromJson(map);

String historyAllToJson(HistoryAll data) => json.encode(data.toJson());

class HistoryAll {
    final List<Datum> data;
    final String message;

    HistoryAll({
        required this.data,
        required this.message,
    });

    factory HistoryAll.fromJson(Map<String, dynamic> json) => HistoryAll(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class Datum {
    final int? id;
    final String? title;
    final String? description;
    final String? photo;
    final int? target;
    final int? fundAcquired;
    final DateTime? startDate;
    final DateTime? endDate;
    final String status;
    final String? rejectedReason;
    final int? userId;
    final dynamic bookmarkId;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final dynamic deletedAt;
    final String postType;
    final List<String>? skillsRequired;
    final int? numberOfVacancies;
    final DateTime? applicationDeadline;
    final String? contactEmail;
    final String? province;
    final String? city;
    final String? subDistrict;
    final String? detailLocation;
    final int? totalRegistrar;
    final String? email;
    final String? fullname;
    final String? address;
    final String? phoneNumber;
    final String? gender;
    final String? nik;
    final String? resume;
    final String? reason;
    final int? transactionId;
    final String? profilePicture;
    final int? fundraiseId;
    final int? amount;
    final String? paymentType;
    final String? virtualAccount;
    final String? urlCallback;
    final String? paidAt;

    Datum({
        this.id,
        this.title,
        this.description,
        this.photo,
        this.target,
        this.fundAcquired,
        this.startDate,
        this.endDate,
        required this.status,
        this.rejectedReason,
        this.userId,
        this.bookmarkId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        required this.postType,
        this.skillsRequired,
        this.numberOfVacancies,
        this.applicationDeadline,
        this.contactEmail,
        this.province,
        this.city,
        this.subDistrict,
        this.detailLocation,
        this.totalRegistrar,
        this.email,
        this.fullname,
        this.address,
        this.phoneNumber,
        this.gender,
        this.nik,
        this.resume,
        this.reason,
        this.transactionId,
        this.profilePicture,
        this.fundraiseId,
        this.amount,
        this.paymentType,
        this.virtualAccount,
        this.urlCallback,
        this.paidAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        photo: json["photo"],
        target: json["target"],
        fundAcquired: json["fund_acquired"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        status: json["status"],
        rejectedReason: json["rejected_reason"],
        userId: json["user_id"],
        bookmarkId: json["bookmark_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        postType: json["post_type"],
        skillsRequired: json["skills_required"] == null ? [] : List<String>.from(json["skills_required"]!.map((x) => x)),
        numberOfVacancies: json["number_of_vacancies"],
        applicationDeadline: json["application_deadline"] == null ? null : DateTime.parse(json["application_deadline"]),
        contactEmail: json["contact_email"],
        province: json["province"],
        city: json["city"],
        subDistrict: json["sub_district"],
        detailLocation: json["detail_location"],
        totalRegistrar: json["total_registrar"],
        email: json["email"],
        fullname: json["fullname"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        gender: json["gender"],
        nik: json["nik"],
        resume: json["resume"],
        reason: json["reason"],
        transactionId: json["transaction_id"],
        profilePicture: json["profile_picture"],
        fundraiseId: json["fundraise_id"],
        amount: json["amount"],
        paymentType: json["payment_type"],
        virtualAccount: json["virtual_account"],
        urlCallback: json["url_callback"],
        paidAt: json["paid_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "photo": photo,
        "target": target,
        "fund_acquired": fundAcquired,
        "start_date": startDate?.toIso8601String(),
        "end_date": endDate?.toIso8601String(),
        "status": status,
        "rejected_reason": rejectedReason,
        "user_id": userId,
        "bookmark_id": bookmarkId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "post_type": postType,
        "skills_required": skillsRequired == null ? [] : List<dynamic>.from(skillsRequired!.map((x) => x)),
        "number_of_vacancies": numberOfVacancies,
        "application_deadline": applicationDeadline?.toIso8601String(),
        "contact_email": contactEmail,
        "province": province,
        "city": city,
        "sub_district": subDistrict,
        "detail_location": detailLocation,
        "total_registrar": totalRegistrar,
        "email": email,
        "fullname": fullname,
        "address": address,
        "phone_number": phoneNumber,
        "gender": gender,
        "nik": nik,
        "resume": resume,
        "reason": reason,
        "transaction_id": transactionId,
        "profile_picture": profilePicture,
        "fundraise_id": fundraiseId,
        "amount": amount,
        "payment_type": paymentType,
        "virtual_account": virtualAccount,
        "url_callback": urlCallback,
        "paid_at": paidAt,
    };
}
