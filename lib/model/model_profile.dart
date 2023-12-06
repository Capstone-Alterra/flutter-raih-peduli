class ModelProfile {
  Data data;
  String message;

  ModelProfile({
    required this.data,
    required this.message,
  });

  factory ModelProfile.fromJson(Map<String, dynamic> json) => ModelProfile(
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
  String email;
  String address;
  String phoneNumber;
  String gender;
  String nik;
  String profilePicture;

  Data({
    required this.id,
    required this.roleId,
    required this.fullname,
    required this.email,
    required this.address,
    required this.phoneNumber,
    required this.gender,
    required this.nik,
    required this.profilePicture,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        roleId: json["role_id"],
        fullname: json["fullname"],
        email: json["email"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        gender: json["gender"],
        nik: json["nik"],
        profilePicture: json["profile_picture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role_id": roleId,
        "fullname": fullname,
        "email": email,
        "address": address,
        "phone_number": phoneNumber,
        "gender": gender,
        "nik": nik,
        "profile_picture": profilePicture,
      };
}
