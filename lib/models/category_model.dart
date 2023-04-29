// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryModel {
  late int id;
  late String name;
  late int parent;
  late String description;
  late String image;

  CategoryModel({
    required this.id,
    required this.name,
    required this.parent,
    required this.description,
    required this.image,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    parent = json['parent'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    //final Map<String, dynamic> data = Map<String, dynamic>();
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['name'] = name;
    data['parent'] = parent;
    data['description'] = description;
    data['image'] = image;

    return data;
  }
}/*End Model */
