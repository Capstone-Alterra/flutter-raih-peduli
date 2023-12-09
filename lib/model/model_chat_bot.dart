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
  DateTime questionTime;
  String reply;
  DateTime replyTime;

  Data({
    required this.question,
    required this.questionTime,
    required this.reply,
    required this.replyTime,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        question: json["question"],
        questionTime: DateTime.parse(json["question_time"]),
        reply: json["reply"],
        replyTime: DateTime.parse(json["reply_time"]),
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "question_time": questionTime.toIso8601String(),
        "reply": reply,
        "reply_time": replyTime.toIso8601String(),
      };
}
