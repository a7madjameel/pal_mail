class TagCreate {
  String? message;
  Tag? tag;

  TagCreate({this.message, this.tag});

  TagCreate.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    tag = json['tag'] != null ? Tag.fromJson(json['tag']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (tag != null) {
      data['tag'] = tag!.toJson();
    }
    return data;
  }
}

class Tag {
  String? name;
  String? updatedAt;
  String? createdAt;
  int? id;

  Tag({this.name, this.updatedAt, this.createdAt, this.id});

  Tag.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
