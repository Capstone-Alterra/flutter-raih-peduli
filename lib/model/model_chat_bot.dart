class ModelChatBot {
  Data data;
  String message;

  ModelChatBot({
    required this.data,
    required this.message,
  });

  factory ModelChatBot.fromJson(Map<String, dynamic> json) => ModelChatBot(
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  String question;
  String reply;

  Data({
    required this.question,
    required this.reply,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        question: json["question"] ?? "",
        reply: json["reply"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "reply": reply,
      };
}
