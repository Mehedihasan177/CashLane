// To parse this JSON data, do
//
//     final notifications = notificationsFromJson(jsonString);

import 'dart:convert';

Notifications notificationsFromJson(String str) => Notifications.fromJson(json.decode(str));

String notificationsToJson(Notifications data) => json.encode(data.toJson());

class Notifications {
  Notifications({
    this.data,
  });

  Data data;

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.allNotificationsOfUser,
  });

  List<AllNotificationsOfUser> allNotificationsOfUser;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    allNotificationsOfUser: List<AllNotificationsOfUser>.from(json["All notifications of User"].map((x) => AllNotificationsOfUser.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "All notifications of User": List<dynamic>.from(allNotificationsOfUser.map((x) => x.toJson())),
  };
}

class AllNotificationsOfUser {
  AllNotificationsOfUser({
    this.id,
    this.userId,
    this.adminId,
    this.title,
    this.description,
    this.paymentId,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String userId;
  String adminId;
  String title;
  String description;
  String paymentId;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory AllNotificationsOfUser.fromJson(Map<String, dynamic> json) => AllNotificationsOfUser(
    id: json["id"],
    userId: json["user_id"],
    adminId: json["admin_id"],
    title: json["title"],
    description: json["description"],
    paymentId: json["payment_id"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "admin_id": adminId,
    "title": title,
    "description": description,
    "payment_id": paymentId,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
