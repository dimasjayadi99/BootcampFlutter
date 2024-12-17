import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Datum> data;
  Support? support;

  UserModel({
    this.page = 0,
    this.perPage = 0,
    this.total = 0,
    this.totalPages = 0,
    required this.data,
    this.support,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@JsonSerializable()
class Datum {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  Datum({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int? ?? 0,
        email: json['email'] as String? ?? 'No email',
        firstName: json['first_name'] as String? ?? 'Unknown',
        lastName: json['last_name'] as String? ?? 'Unknown',
        avatar: json['avatar'] as String? ?? '',
      );
}

@JsonSerializable()
class Support {
  String? url;
  String? text;

  Support({
    this.url,
    this.text,
  });

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json['url'] as String? ?? '',
        text: json['text'] as String? ?? '',
      );
}
