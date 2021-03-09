import 'dart:convert';

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
    this.user,
  });

  int id;
  String title;
  String description;
  String imageUrl;
  int targetAmount;
  int amountGained;
  double progress;
  int approved;
  Category category;
  User user;

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
        "category": category.toJson(),
        "user": user.toJson(),
      };
}

class Category {
  Category({
    this.name,
  });

  String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class User {
  User({
    this.name,
    this.email,
  });

  String name;
  String email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
      };
}
