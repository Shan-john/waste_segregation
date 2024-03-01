import 'package:json_annotation/json_annotation.dart';

part 'usermodel.g.dart';

@JsonSerializable()
class Usermodel {
  String? name;
  String? id;
  String? email;

  Usermodel({this.name, this.id, this.email});

  factory Usermodel.fromJson(Map<String, dynamic> json) {
    return _$UsermodelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UsermodelToJson(this);

  Usermodel copyWith({
    String? name,
    String? id,
    String? email,
  }) {
    return Usermodel(
      name: name ?? this.name,
      id: id ?? this.id,
      email: email ?? this.email,
    );
  }
}
