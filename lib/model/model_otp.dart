class ModelOtp {
  String message;

  ModelOtp({
    required this.message,
  });

  factory ModelOtp.fromJson(Map<String, dynamic> json) => ModelOtp(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
