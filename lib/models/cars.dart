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
    required this.id,
    required this.title,
    required this.slug,
    required this.catId,
    required this.brandId,
    required this.price,
    required this.year,
    required this.seats,
    required this.status,
    required this.thumbnail,
    this.createdAt,
    this.updatedAt,
    required this.images,
  });

  int id;
  String title;
  String slug;
  int catId;
  int brandId;
  String price;
  String year;
  String seats;
  String status;
  String thumbnail;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Images> images;

  factory CarElement.fromJson(Map<String, dynamic> json) => CarElement(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        catId: json["cat_id"],
        brandId: json["brand_id"],
        price: json["price"],
        year: json["year"],
        seats: json["seats"],
        status: json["status"],
        thumbnail: json["thumbnail"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        images:
            List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "cat_id": catId,
        "brand_id": brandId,
        "price": price,
        "year": year,
        "seats": seats,
        "status": status,
        "thumbnail": thumbnail,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class Images {
  Images({
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

  factory Images.fromJson(Map<String, dynamic> json) => Images(
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
