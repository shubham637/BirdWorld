class UserDataModel {
  final String name;
  final String profilePic;
  final bool? isLogin;
  final String email;
  final String key;
  UserDataModel({
    required this.name,
    required this.profilePic,
    this.isLogin,
    required this.email,
    required this.key,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'profilePic': profilePic,
      'email': email,
      'key': key,
    };
  }
}
