import 'dart:convert';

List<FetchData> myDBFromJson(String str) =>
    List<FetchData>.from(json.decode(str).map((x) => FetchData.fromJson(x)));

String myDBToJson(List<FetchData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FetchData {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  FetchData({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory FetchData.fromJson(Map<String, dynamic> json) => FetchData(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json['last_name'],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "avatar": avatar,
      };
}
