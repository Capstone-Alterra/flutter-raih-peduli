import 'dart:convert';

ModelTokenForgetPassword modelTokenForgetPasswordFromJson(Map<String, dynamic> str) => ModelTokenForgetPassword.fromJson((str));

String modelTokenForgetPasswordToJson(ModelTokenForgetPassword data) => json.encode(data.toJson());

class ModelTokenForgetPassword {
    String accessToken;
    String message;

    ModelTokenForgetPassword({
        required this.accessToken,
        required this.message,
    });

    factory ModelTokenForgetPassword.fromJson(Map<String, dynamic> json) => ModelTokenForgetPassword(
        accessToken: json["access_token"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "message": message,
    };
}
