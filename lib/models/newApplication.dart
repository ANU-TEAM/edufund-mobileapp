import 'dart:io';

class NewApplication {
  String? title;
  String? description;
  File? imageUrl;
  double? targetAmount;
  int? category;
  int? school;

  NewApplication({
    this.title,
    this.description,
    this.imageUrl,
    this.targetAmount,
    this.category,
    this.school,
  });
}
