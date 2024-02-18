import 'dart:convert';

List<SchoolModel> schoolModelFromJson(String str) => List<SchoolModel>.from(
    json.decode(str).map((x) => SchoolModel.fromJson(x)));

String schoolModelToJson(List<SchoolModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SchoolModel {
  SchoolModel({
    this.name,
    this.domains,
  });

  String? name;
  List<String>? domains;

  factory SchoolModel.fromJson(Map<String, dynamic> json) => SchoolModel(
        name: json["name"],
        domains: List<String>.from(json["domains"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "domains": List<dynamic>.from(domains!.map((x) => x)),
      };

  String get domainString {
    return domains!.join(', ');
  }
}
