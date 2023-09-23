import 'dart:convert';

CategoryModel categoriesFromJson(String str, String? filterBy) =>
    CategoryModel.fromJson(json.decode(str));

String categoriesToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  final List<Categories>? categories;

  CategoryModel({
    this.categories,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        categories: json["categories"] == null
            ? []
            : List<Categories>.from(json["categories"]!.map((x) {
                Categories.fromJson(x);
              })),
      );

  Map<String, dynamic> toJson() => {
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
      };
}

class Categories {
  final int? id;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? sendersCount;
  final List<Sender>? senders;
  Categories({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.sendersCount,
    this.senders,
  });

  factory Categories.fromJson(Map<String, dynamic> json) =>
      Categories(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        sendersCount: json["senders_count"],
        senders: json["senders"] == null
            ? []
            : List<Sender>.from(json["senders"]!.map((x) {
                Sender.fromJson(x);
              })),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "senders_count": sendersCount,
        "senders": senders == null
            ? []
            : List<dynamic>.from(senders!.map((x) => x.toJson())),
      };
}

class Sender {
  final int? id;
  final String? name;
  final String? mobile;
  final String? address;
  final String? categoryId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final SenderCategory? category;

  Sender({
    this.id,
    this.name,
    this.mobile,
    this.address,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  factory Sender.fromJson(Map<String, dynamic> json) => Sender(
        id: json["id"],
        name: json["name"],
        mobile: json["mobile"],
        address: json["address"],
        categoryId: json["category_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        category: json["category"] == null
            ? null
            : SenderCategory.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobile": mobile,
        "address": address,
        "category_id": categoryId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "category": category?.toJson(),
      };
}

class SenderCategory {
  final int? id;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  SenderCategory({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory SenderCategory.fromJson(Map<String, dynamic> json) => SenderCategory(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
