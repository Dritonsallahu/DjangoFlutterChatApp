import 'dart:convert';

class Note {
  late int? id;
  late String? note;

  Note({ this.id,  this.note});

  Note copyWith({int? id, String? note}) {
    return Note(id: id ?? this.id, note: note ?? this.note);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'body': note,
    };
  }

  factory Note.fromMap(Map<dynamic, String> map) {
    return Note(
      id: map['id'] as dynamic,
      note: map['body'],
    );
  }

  String toJson() => json.encode(toMap());

  // factory Note.fromJson(String source) => Note.fromMap(jsonDecode(source))
}
