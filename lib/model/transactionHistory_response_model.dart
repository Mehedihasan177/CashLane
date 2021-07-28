// To parse this JSON data, do
//
//     final transactionHistory = transactionHistoryFromJson(jsonString);

import 'dart:convert';

TransactionHistory transactionHistoryFromJson(String str) => TransactionHistory.fromJson(json.decode(str));

String transactionHistoryToJson(TransactionHistory data) => json.encode(data.toJson());

class TransactionHistory {
    TransactionHistory({
        this.data,
        this.success,
        this.message,
    });

    List<Datum> data;
    bool success;
    String message;

    factory TransactionHistory.fromJson(Map<String, dynamic> json) => TransactionHistory(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "success": success,
        "message": message,
    };
}

// To parse this JSON data, do
//
//     final datum = datumFromJson(jsonString);

class Datum {
    Datum({
        this.id,
        this.userId,
        this.amount,
        this.type,
        this.comment,
        this.details,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String userId;
    String amount;
    String type;
    String comment;
    String details;
    DateTime createdAt;
    DateTime updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        amount: json["amount"],
        type: json["type"],
        comment: json["comment"],
        details: json["details"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "amount": amount,
        "type": type,
        "comment": comment,
        "details": details,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
