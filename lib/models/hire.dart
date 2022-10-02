//import 'dart:convert';

class Hire {
  final int id;
  final String start;
  final String end;

  const Hire({required this.id, required this.start, required this.end});

  factory Hire.fromJson(Map<String, dynamic> json) {
    return Hire(
      id: json['id'],
      start: json['start'],
      end: json['end'],
    );
  }
}

/*
Hire hireFromJson(String str) => Hire.fromJson(json.decode(str));

String hireToJson(Hire data) => json.encode(data.toJson());

class Hire {
  Hire({
    required this.start,
    required this.end,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  DateTime start;
  DateTime end;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory Hire.fromJson(Map<String, dynamic> json) => Hire(
        start: DateTime.parse(json["start"]),
        end: DateTime.parse(json["end"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "start": start,
        "end": end,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}*/