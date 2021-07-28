// To parse this JSON data, do
//
//     final cashoutHistory = cashoutHistoryFromJson(jsonString);

import 'dart:convert';

CashoutHistory cashoutHistoryFromJson(String str) => CashoutHistory.fromJson(json.decode(str));

String cashoutHistoryToJson(CashoutHistory data) => json.encode(data.toJson());

class CashoutHistory {
  CashoutHistory({
    this.pending,
  });

  List<Pending> pending;

  factory CashoutHistory.fromJson(Map<String, dynamic> json) => CashoutHistory(
    pending: List<Pending>.from(json["Pending"].map((x) => Pending.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Pending": List<dynamic>.from(pending.map((x) => x.toJson())),
  };
}

class Pending {
  Pending({
    this.id,
    this.userId,
    this.transferId,
    this.amount,
    this.type,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  String userId;
  dynamic transferId;
  String amount;
  String type;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Pending.fromJson(Map<String, dynamic> json) => Pending(
    id: json["id"],
    userId: json["user_id"],
    transferId: json["transfer_id"],
    amount: json["amount"],
    type: json["type"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "transfer_id": transferId,
    "amount": amount,
    "type": type,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
