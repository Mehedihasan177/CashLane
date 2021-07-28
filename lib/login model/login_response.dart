import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    LoginResponse({
        this.statusCode,
        this.accessToken,
        this.tokenType,
    });

    int statusCode;
    String accessToken;
    String tokenType;

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        statusCode: json["status_code"],
        accessToken: json["access_token"],
        tokenType: json["token_type"],
    );

    Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "access_token": accessToken,
        "token_type": tokenType,
    };
}