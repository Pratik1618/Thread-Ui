// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final dynamic Name;
  final dynamic Text;
  UserModel({
    required this.Name,
    required this.Text,
  });

  UserModel copyWith({
    dynamic? Name,
    dynamic? Text,
  }) {
    return UserModel(
      Name: Name ?? this.Name,
      Text: Text ?? this.Text,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Name': Name,
      'Text': Text,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      Name: map['Name'] as dynamic,
      Text: map['Text'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(Name: $Name, Text: $Text)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.Name == Name && other.Text == Text;
  }

  @override
  int get hashCode => Name.hashCode ^ Text.hashCode;
}
