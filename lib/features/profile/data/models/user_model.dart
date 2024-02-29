class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final String token;

  UserModel({
    required this.id,
    required this.name,
    required this.image,
    required this.token,
    required this.phone,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      token: json['token'],
      phone: json['phone'],
      email: json['email'],
    );
  }



}
