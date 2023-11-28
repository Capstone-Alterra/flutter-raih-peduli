import 'dart:convert';

ModelSignUp modelSignUpFromJson(Map<String, dynamic> str) => ModelSignUp.fromJson((str));

String modelSignUpToJson(ModelSignUp data) => json.encode(data.toJson());

class ModelSignUp {
    Data data;
    String message;

    ModelSignUp({
        required this.data,
        required this.message,
    });

    factory ModelSignUp.fromJson(Map<String, dynamic> json) => ModelSignUp(
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
    int roleId;
    String fullname;
    String address;
    String phoneNumber;
    String gender;
    String email;

    Data({
        required this.id,
        required this.roleId,
        required this.fullname,
        required this.address,
        required this.phoneNumber,
        required this.gender,
        required this.email,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        roleId: json["role_id"],
        fullname: json["fullname"],
        address: json["address"] ?? "",
        phoneNumber: json["phone_number"] ?? "",
        gender: json["gender"] ?? "",
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "role_id": roleId,
        "fullname": fullname,
        "address": address,
        "phone_number": phoneNumber,
        "gender": gender,
        "email": email,
    };
}
