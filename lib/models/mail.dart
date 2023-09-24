// mail_model.dart
import 'dart:convert';

class Mail {
  final int id;
  final String subject;
  final String description;
  final String senderId;
  final String archiveNumber;
  final String archiveDate;
  final String? decision;
  final String statusId;
  final String? finalDecision;
  final String createdAt;
  final String updatedAt;
  final Sender sender;
  final Status status;
  final List<Activity> activities;
  final List<Tag> tags;

  Mail({
    required this.id,
    required this.subject,
    required this.description,
    required this.senderId,
    required this.archiveNumber,
    required this.archiveDate,
    required this.decision,
    required this.statusId,
    required this.finalDecision,
    required this.createdAt,
    required this.updatedAt,
    required this.sender,
    required this.status,
    required this.activities,
    required this.tags,
  });

  factory Mail.fromJson(Map<String, dynamic> json) {
    return Mail(
      id: json['id'],
      subject: json['subject'],
      description: json['description'],
      senderId: json['sender_id'],
      archiveNumber: json['archive_number'],
      archiveDate: json['archive_date'],
      decision: json['decision'],
      statusId: json['status_id'],
      finalDecision: json['final_decision'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      sender: Sender.fromJson(json['sender']),
      status: Status.fromJson(json['status']),
      activities: List<Activity>.from(json['activities'].map((x) => Activity.fromJson(x))),
      tags: List<Tag>.from(json['tags'].map((x) => Tag.fromJson(x))),
    );
  }
}

class Sender {
  final int id;
  final String name;
  final String mobile;
  final String categoryId;
  final String createdAt;
  final String updatedAt;
  final Category category;

  Sender({
    required this.id,
    required this.name,
    required this.mobile,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
  });

  factory Sender.fromJson(Map<String, dynamic> json) {
    return Sender(
      id: json['id'],
      name: json['name'],
      mobile: json['mobile'],
      categoryId: json['category_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      category: Category.fromJson(json['category']),
    );
  }
}

class Category {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Status {
  final int id;
  final String name;
  final String color;
  final String createdAt;
  final String updatedAt;

  Status({
    required this.id,
    required this.name,
    required this.color,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      id: json['id'],
      name: json['name'],
      color: json['color'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Activity {
  final int id;
  final String body;
  final String userId;
  final String mailId;
  final String createdAt;
  final String updatedAt;
  final User user;

  Activity({
    required this.id,
    required this.body,
    required this.userId,
    required this.mailId,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      id: json['id'],
      body: json['body'],
      userId: json['user_id'],
      mailId: json['mail_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String image;
  final String roleId;
  final String createdAt;
  final String updatedAt;
  final Role role;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.roleId,
    required this.createdAt,
    required this.updatedAt,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      image: json['image'],
      roleId: json['role_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      role: Role.fromJson(json['role']),
    );
  }
}

class Role {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;

  Role({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Tag {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;
  final Pivot pivot;

  Tag({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      pivot: Pivot.fromJson(json['pivot']),
    );
  }
}

class Pivot {
  final String mailId;
  final String tagId;

  Pivot({
    required this.mailId,
    required this.tagId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      mailId: json['mail_id'],
      tagId: json['tag_id'],
    );
  }
}
