List<CategoryModel> categoriesFromJson(dynamic str) =>
    List<CategoryModel>.from((str).map((x) => CategoryModel.fromJson(x)));

class CategoryModel {
  int id = 0;
  String name = '';
  int parent = 0;
  String description = '';
  late String image = '';

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
