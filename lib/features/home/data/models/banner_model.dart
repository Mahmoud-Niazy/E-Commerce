class BannerModel {
  final int id;
  final String image;

  BannerModel({
    required this.image,
    required this.id,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      image: json['image'],
      id: json['id'],
    );
  }
}
