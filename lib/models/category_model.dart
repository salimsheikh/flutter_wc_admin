import 'dart:convert';

List<CategoryModel> categoriesFromJson(dynamic str) =>
    List<CategoryModel>.from((str).map((x) => CategoryModel.fromJson(x)));

CategoryModel categoryFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

class CategoryModel {
  int id = 0;
  String name = '';
  int? parent = 0;
  String description = '';
  bool success = true;
  //String image = '';

  CategoryModel({
    required this.id,
    required this.name,
    this.parent,
    required this.description,
    //required this.image,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'].toString().replaceAll("&amp;", "&");
    parent = json['parent'];
    description = json['description'].toString().replaceAll("&amp;", "&");
    //image = json['image'];
  }

  Map<String, dynamic> toJson() {
    //final Map<String, dynamic> data = Map<String, dynamic>();
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['name'] = name;
    data['parent'] = parent;
    data['description'] = description;
    // data['image'] = image;

    return data;
  }
}/*End Model */
