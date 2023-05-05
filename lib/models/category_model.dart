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

  String fileName = '';
  CategoryImage? image;

  CategoryModel({
    required this.id,
    required this.name,
    this.parent,
    required this.description,
    this.image,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'].toString().replaceAll("&amp;", "&");
    parent = json['parent'];
    description = json['description'].toString().replaceAll("&amp;", "&");
    image = json['image'] != null
        ? CategoryImage.fromJson(json['image'])
        : CategoryImage();
  }

  Map<String, dynamic> toJson() {
    //final Map<String, dynamic> data = Map<String, dynamic>();
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['name'] = name;
    data['parent'] = parent;
    data['description'] = description;
    // data['image'] = image;

    if (image != null) {
      data['image'] = image.toString();
    }

    return data;
  }
} /*End Model */

class CategoryImage {
  late String? src = '';

  CategoryImage({this.src});

  CategoryImage.fromJson(Map<String, dynamic> json) {
    src = json['src'];
  }

  Map<String, dynamic> toJson() {
    //final Map<String, dynamic> data = Map<String, dynamic>();
    final Map<String, dynamic> data = <String, dynamic>{};
    data['src'] = src;
    return data;
  }
}
