import 'dart:convert';

List<MessageModel> messageModelFromJson(String str) => List<MessageModel>.from(
    json.decode(str).map((x) => MessageModel.fromJson(x)));

String messageModelToJson(List<MessageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MessageModel {
  String name;
  String image;
  String message;
  int unreadMessageCount;
  DateTime date;
  String id;

  MessageModel({
    required this.name,
    required this.image,
    required this.message,
    required this.unreadMessageCount,
    required this.date,
    required this.id,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        name: json["name"],
        image: json["image"],
        message: json["message"],
        unreadMessageCount: json["unread_message_count"],
        date: DateTime.parse(json["date"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "message": message,
        "unread_message_count": unreadMessageCount,
        "date": date.toIso8601String(),
        "id": id,
      };
}
