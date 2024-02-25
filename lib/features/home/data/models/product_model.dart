class ProductModel {
  final int id ;
  final num price ;
  final num? oldPrice ;
  final num? discount ;
  final String image ;
  final String name ;
  final String description ;
  final List<String >? images ;
  bool? inFav;
  bool? inCart;

  ProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.discount,
    required this.images,
    required this.inCart,
    required this.inFav,
    required this.oldPrice,
});

  factory ProductModel.fromJson(Map<String,dynamic>json){
    List<String> productImages = [];
    if(json['images'] != null){
      json['images'].forEach((image){
        productImages.add(image);
      });
    }
    return ProductModel(
      image: json['image'],
      id: json['id'],
      price: json['price'],
      name: json["name"],
      description: json['description'],
      discount: json['discount'],
      images: productImages,
      inCart: json['in_cart'],
      inFav: json['in_favorites'],
      oldPrice: json['old_price'],
    );
  }
}