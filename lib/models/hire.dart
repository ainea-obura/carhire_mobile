//import 'dart:convert';

// To parse this JSON data, do
//
//     final hire = hireFromJson(jsonString);

import 'dart:convert';

Hire hireFromJson(String str) => Hire.fromJson(json.decode(str));

String hireToJson(Hire data) => json.encode(data.toJson());

class Hire {
  Hire({
    required this.hire,
  });

  List<HireElement> hire;

  factory Hire.fromJson(Map<String, dynamic> json) => Hire(
    hire: List<HireElement>.from(json["hire"].map((x) => HireElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "hire": List<dynamic>.from(hire.map((x) => x.toJson())),
  };
}

class HireElement {
  HireElement({
    required this.id,
    required this.userId,
    required this.carId,
    required this.start,
    required this.end,
    required this.amount,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int userId;
  int carId;
  DateTime start;
  DateTime end;
  String amount;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory HireElement.fromJson(Map<String, dynamic> json) => HireElement(
    id: json["id"],
    userId: json["user_id"],
    carId: json["car_id"],
    start: DateTime.parse(json["start"]),
    end: DateTime.parse(json["end"]),
    amount: json["amount"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "car_id": carId,
    "start": "${start.year.toString().padLeft(4, '0')}-${start.month.toString().padLeft(2, '0')}-${start.day.toString().padLeft(2, '0')}",
    "end": "${end.year.toString().padLeft(4, '0')}-${end.month.toString().padLeft(2, '0')}-${end.day.toString().padLeft(2, '0')}",
    "amount": amount,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}


/*class Hire {
  final int id;
  final int carId;
  final String start;
  final String end;
  final String amount;

  const Hire({required this.id, required this.carId, required this.start, required this.end, required this.amount});

  factory Hire.fromJson(Map<String, dynamic> json) {
    return Hire(
      id: json['id'],
      carId: json['car_id'],
      start: json['start'],
      end: json['end'],
      amount: json['amount']
    );
  }
}*/

