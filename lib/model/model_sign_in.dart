import 'dart:convert';

ModelSignIn modelSignInFromJson(Map<String, dynamic> str) =>
    ModelSignIn.fromJson((str));

String modelSignInToJson(ModelSignIn data) => json.encode(data.toJson());

class ModelSignIn {
  Data data;
  String message;

  ModelSignIn({
    required this.data,
    required this.message,
  });

  factory ModelSignIn.fromJson(Map<String, dynamic> json) => ModelSignIn(
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  String fullname;
  String email;
  int roleId;
  String profilePicture;
  bool personalizeUser;
  String accessToken;
  String refreshToken;

  Data({
    required this.fullname,
    required this.email,
    required this.roleId,
    required this.profilePicture,
    required this.personalizeUser,
    required this.accessToken,
    required this.refreshToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        fullname: json["fullname"],
        email: json["email"],
        roleId: json["role_id"],
        profilePicture: json["profile_picture"],
        personalizeUser: json["personalize_user"],
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "email": email,
        "role_id": roleId,
        "profile_picture": profilePicture,
        "personalize_user": personalizeUser,
        "access_token": accessToken,
        "refresh_token": refreshToken,
      };
}
