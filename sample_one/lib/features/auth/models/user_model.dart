// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String? token;
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final bool? isVerified;
  final String? oneSignalId;
  final String? phoneNumber;
  final int? v;

  UserModel({
    this.token,
    this.id,
    this.name,
    this.email,
    this.password,
    this.isVerified,
    this.oneSignalId,
    this.phoneNumber,
    this.v,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        token: json["token"],
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        isVerified: json["isVerified"],
        oneSignalId: json["oneSignalId"],
        phoneNumber: json["phoneNumber"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "isVerified": isVerified,
        "oneSignalId": oneSignalId,
        "phoneNumber": phoneNumber,
        "__v": v,
      };
}
