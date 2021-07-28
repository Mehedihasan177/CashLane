// To parse this JSON data, do
//
//     final sentMoney = sentMoneyFromJson(jsonString);

import 'dart:convert';

SentMoney sentMoneyFromJson(String str) => SentMoney.fromJson(json.decode(str));

String sentMoneyToJson(SentMoney data) => json.encode(data.toJson());

class SentMoney {
    SentMoney({
        this.data,
        this.success,
        this.message,
    });

    Data data;
    bool success;
    String message;

    factory SentMoney.fromJson(Map<String, dynamic> json) => SentMoney(
        data: Data.fromJson(json["data"]),
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "success": success,
        "message": message,
    };
}

class Data {
    Data({
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

    factory Data.fromJson(Map<String, dynamic> json) => Data(
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
