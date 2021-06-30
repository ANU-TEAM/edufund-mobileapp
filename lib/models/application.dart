import 'dart:convert';

import 'package:mobileapp/models/school.dart';

List<Application> applicationFromJson(String str) => List<Application>.from(
    json.decode(str).map((x) => Application.fromJson(x)));

String applicationToJson(List<Application> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Application {
  Application({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.targetAmount,
    this.amountGained,
    this.progress,
    this.approved,
    this.category,
    this.school,
    this.user,
  });

  int? id;
  String? title;
  String? description;
  String? imageUrl;
  int? targetAmount;
  int? amountGained;
  double? progress;
  int? approved;
  Category? category;
  School? school;
  User? user;

  factory Application.fromJson(Map<String, dynamic> json) => Application(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        imageUrl: json["image_url"],
        targetAmount: json["target_amount"],
        amountGained: json["amount_gained"],
        progress: json["progress"].toDouble(),
        approved: json["approved"],
        category: Category.fromJson(json["category"]),
        school: School.fromJson(json["school"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image_url": imageUrl,
        "target_amount": targetAmount,
        "amount_gained": amountGained,
        "progress": progress,
        "approved": approved,
        "category": category!.toJson(),
        "school": school!.toJson(),
        "user": user!.toJson(),
      };
}

class Category {
  Category({
    this.id,
    this.name,
  });

  String? name;
  int? id;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class User {
  User({
    this.name,
    this.email,
  });

  String? name;
  String? email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
      };
}
