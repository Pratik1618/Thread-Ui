// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SearchModel {
  dynamic Sname;
  dynamic Susername;
  dynamic imagepath;
  SearchModel({
    required this.Sname,
    required this.Susername,
    required this.imagepath,
  });

  SearchModel copyWith({
    dynamic? Sname,
    dynamic? Susername,
    dynamic? imagepath,
  }) {
    return SearchModel(
      Sname: Sname ?? this.Sname,
      Susername: Susername ?? this.Susername,
      imagepath: imagepath ?? this.imagepath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Sname': Sname,
      'Susername': Susername,
      'imagepath': imagepath,
    };
  }

  factory SearchModel.fromMap(Map<String, dynamic> map) {
    return SearchModel(
      Sname: map['Sname'] as dynamic,
      Susername: map['Susername'] as dynamic,
      imagepath: map['imagepath'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchModel.fromJson(String source) =>
      SearchModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SearchModel(Sname: $Sname, Susername: $Susername, imagepath: $imagepath)';

  @override
  bool operator ==(covariant SearchModel other) {
    if (identical(this, other)) return true;

    return other.Sname == Sname &&
        other.Susername == Susername &&
        other.imagepath == imagepath;
  }

  @override
  int get hashCode => Sname.hashCode ^ Susername.hashCode ^ imagepath.hashCode;
}
