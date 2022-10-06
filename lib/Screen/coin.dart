import 'dart:convert';

import 'package:flutter/cupertino.dart';

// class Coin {
//   Coin({
//     required this.name,
//     required this.symbol,
//     required this.imageUrl,
//     required this.price,
//     required this.change,
//     required this.changePercentage,
//   });

//   String name;
//   String symbol;
//   String imageUrl;
//   num price;
//   num change;
//   num changePercentage;

//   factory Coin.fromJson(Map<String, dynamic> json) {
//     return Coin(
//       name: json['name'],
//       symbol: json['symbol'],
//       imageUrl: json['image'],
//       price: json['current_price'],
//       change: json['price_change_24h'],
//       changePercentage: json['price_change_percentage_24h'],
//     );
//   }
// }
List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.priceChange24H,
    required this.priceChangePercentage24H,
  });

  String symbol;
  String name;
  String image;
  String currentPrice;

  double priceChange24H;
  double priceChangePercentage24H;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        symbol: json["symbol"],
        name: json["name"],
        image: json["image"],
        priceChange24H: json["price_change_24h"].toDouble(),
        priceChangePercentage24H:
            json["price_change_percentage_24h"].toDouble(),
        currentPrice: json["current_price"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "name": name,
        "image": image,
        "current_price": currentPrice,
        "price_change_24h": priceChange24H,
        "price_change_percentage_24h": priceChangePercentage24H,
        "current_price": currentPrice,
      };
}
