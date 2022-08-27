import "dart:convert";

Car carFromJson(String str) => Car.fromJson(json.decode(str));

String carToJson(Car data) => json.encode(data.toJson());

class Car {
  Car({
    required this.cars,
  });

  List<CarElement> cars;

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        cars: List<CarElement>.from(
            json["cars"].map((x) => CarElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cars": List<dynamic>.from(cars.map((x) => x.toJson())),
      };
}

class CarElement {
  CarElement({
    this.id,
    this.title,
    this.slug,
    this.catId,
    this.brandId,
    this.price,
    this.summary,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
    required this.images,
  });

  int? id;
  String? title;
  String? slug;
  int? catId;
  int? brandId;
  String? price;
  String? summary;
  String? description;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Image> images;

  factory CarElement.fromJson(Map<String, dynamic> json) => CarElement(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        catId: json["cat_id"],
        brandId: json["brand_id"],
        price: json["price"],
        summary: json["summary"],
        description: json["description"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "cat_id": catId,
        "brand_id": brandId,
        "price": price,
        "summary": summary,
        "description": description,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class Image {
  Image({
    this.id,
    this.carId,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? carId;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        carId: json["car_id"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "car_id": carId,
        "image": image,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
