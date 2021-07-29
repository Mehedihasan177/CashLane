// To parse this JSON data, do
//
//     final searchedUserResponse = searchedUserResponseFromJson(jsonString);

import 'dart:convert';

SearchedUserResponse searchedUserResponseFromJson(String str) => SearchedUserResponse.fromJson(json.decode(str));

String searchedUserResponseToJson(SearchedUserResponse data) => json.encode(data.toJson());

class SearchedUserResponse {
  SearchedUserResponse({
    this.id,
    this.name,
    this.email,
    this.wallet,
    this.username,
    this.phone,
    this.address,
    this.image,
    this.status,
    this.provider,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  String name;
  String email;
  int wallet;
  String username;
  dynamic phone;
  dynamic address;
  dynamic image;
  bool status;
  dynamic provider;
  dynamic emailVerifiedAt;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;

  factory SearchedUserResponse.fromJson(Map<String, dynamic> json) => SearchedUserResponse(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    wallet: json["wallet"],
    username: json["username"],
    phone: json["phone"],
    address: json["address"],
    image: json["image"],
    status: json["status"],
    provider: json["provider"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: (json["created_at"]).toString(),
    updatedAt: (json["updated_at"]).toString(),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "wallet": wallet,
    "username": username,
    "phone": phone,
    "address": address,
    "image": image,
    "status": status,
    "provider": provider,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
  };
}
