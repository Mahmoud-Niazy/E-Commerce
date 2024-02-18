class CategoryModel {
  final int id;

  final String name;

  final String image;

  CategoryModel({
    required this.name,
    required this.image,
    required this.id,
  });

  factory CategoryModel.fomJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'],
      image: json['image'],
      id: json['id'],
    );
  }
}
