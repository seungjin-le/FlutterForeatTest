class LoginVo {
  final String email;
  final String password;

  LoginVo({required this.email, required this.password});

  factory LoginVo.fromJson(Map<String, dynamic> json) {
    return LoginVo(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
