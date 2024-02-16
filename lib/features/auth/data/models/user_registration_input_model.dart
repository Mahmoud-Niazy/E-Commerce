class UserRegistrationInputModel {
  final String email;
  final String name ;
  final String password;
  final String phone;

  UserRegistrationInputModel({
    required this.phone,
    required this.password,
    required this.email,
    required this.name,
});

  toJson(){
    return {
      'name' : name,
      'email' : email,
      'password' : password,
      'phone' : phone,
    };
  }
}