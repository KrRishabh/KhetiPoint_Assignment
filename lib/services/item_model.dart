import 'package:flutter/material.dart';

class Item {
  String author;
  String name;
  String avatar;
  String url;
  String description;
  String language;
  String languageColor;
  int stars;
  int forks;
  int currentPeriodStars;

  Item({
    this.author,
    this.name,
    this.avatar,
    this.url,
    this.description,
    this.language,
    this.languageColor,
    this.stars,
    this.forks,
    this.currentPeriodStars,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      author: json['author'],
      name: json['name'],
      avatar: json['avatar'],
      url: json['url'],
      description: json['description'],
      language: json['language'],
      languageColor: json['languageColor'],
      stars: json['stars'],
      forks: json['forks'],
      currentPeriodStars: json['currentPeriodStars'],
    );
  }
}
