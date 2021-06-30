import 'dart:io';

class EditApplication {
  int? id;
  String? title;
  String? description;
  File? imageUrl;
  double? targetAmount;
  int? school;
  int? category;

  EditApplication({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.targetAmount,
    this.school,
    this.category,
  });
}
