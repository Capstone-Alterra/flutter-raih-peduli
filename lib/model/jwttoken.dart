import 'dart:convert';

JwtTokenModel jwtTokenModelFromJson(Map<String, dynamic>map) =>
    JwtTokenModel.fromJson(map);

String jwtTokenModelToJson(JwtTokenModel data) => json.encode(data.toJson());

class JwtTokenModel {
  final Data data;
  final String message;

  JwtTokenModel({
    required this.data,
    required this.message,
  });

  factory JwtTokenModel.fromJson(Map<String, dynamic> json) => JwtTokenModel(
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  final String accessToken;
  final String refreshToken;

  Data({
    required this.accessToken,
    required this.refreshToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "refresh_token": refreshToken,
      };
}
