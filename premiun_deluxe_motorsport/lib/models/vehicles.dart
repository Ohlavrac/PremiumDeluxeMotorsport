// To parse this JSON data, do
//
//     final Vehicles = VehiclesFromMap(jsonString);

import 'dart:convert';

class Vehicles {
    Vehicles({
      this.images,
      this.manufacturer,
      this.model,
      this.seats,
      this.price,
      this.topSpeed,
      this.speed,
      this.acceleration,
      this.braking,
      this.handling,
    });

    Images? images;
    String? manufacturer;
    String? model;
    int? seats;
    int? price;
    TopSpeed? topSpeed;
    double? speed;
    double? acceleration;
    double? braking;
    double? handling;

    factory Vehicles.fromJson(String str) => Vehicles.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Vehicles.fromMap(Map<String, dynamic> json) => Vehicles(
        images: Images.fromMap(json["images"]),
        manufacturer: json["manufacturer"],
        model: json["model"],
        seats: json["seats"],
        price: json["price"],
        topSpeed: TopSpeed.fromMap(json["topSpeed"]),
        speed: json["speed"].toDouble(),
        acceleration: json["acceleration"].toDouble(),
        braking: json["braking"].toDouble(),
        handling: json["handling"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "images": images!.toMap(),
        "manufacturer": manufacturer,
        "model": model,
        "seats": seats,
        "price": price,
        "topSpeed": topSpeed!.toMap(),
        "speed": speed,
        "acceleration": acceleration,
        "braking": braking,
        "handling": handling,
    };
}

class Images {
    Images({
      this.frontQuarter,
      this.rearQuarter,
      this.front,
      this.rear,
      this.side,
    });

    String? frontQuarter;
    String? rearQuarter;
    String? front;
    String? rear;
    String? side;

    factory Images.fromJson(String str) => Images.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Images.fromMap(Map<String, dynamic> json) => Images(
        frontQuarter: json["frontQuarter"],
        rearQuarter: json["rearQuarter"],
        front: json["front"],
        rear: json["rear"],
        side: json["side"],
    );

    Map<String, dynamic> toMap() => {
        "frontQuarter": frontQuarter,
        "rearQuarter": rearQuarter,
        "front": front,
        "rear": rear,
        "side": side,
    };
}

class TopSpeed {
    TopSpeed({
      this.mph,
      this.kmh,
    });

    int? mph;
    int? kmh;

    factory TopSpeed.fromJson(String str) => TopSpeed.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TopSpeed.fromMap(Map<String, dynamic> json) => TopSpeed(
        mph: json["mph"],
        kmh: json["kmh"],
    );

    Map<String, dynamic> toMap() => {
        "mph": mph,
        "kmh": kmh,
    };
}
