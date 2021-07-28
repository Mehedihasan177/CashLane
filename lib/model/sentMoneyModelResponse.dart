// To parse this JSON data, do
//
//     final sentMoneyModelResponse = sentMoneyModelResponseFromJson(jsonString);

import 'dart:convert';

SentMoneyModelResponse sentMoneyModelResponseFromJson(String str) => SentMoneyModelResponse.fromJson(json.decode(str));

String sentMoneyModelResponseToJson(SentMoneyModelResponse data) => json.encode(data.toJson());


class SentMoneyModelResponse {
  SentMoneyModelResponse({
    this.userId,
    this.transferId,
    this.amount,
    this.type,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  int userId;
  int transferId;
  String amount;
  String type;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory SentMoneyModelResponse.fromJson(Map<String, dynamic> json) => SentMoneyModelResponse(
    userId: json["user_id"],
    transferId: json["transfer_id"],
    amount: json["amount"],
    type: json["type"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "transfer_id": transferId,
    "amount": amount,
    "type": type,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}
