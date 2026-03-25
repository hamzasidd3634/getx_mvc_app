/// Model representing a user (login response).
class UserModel {
  final int id;
  final String email;
  final String token;

  UserModel({
    required this.id,
    required this.email,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int? ?? 0,
      email: json['email'] as String? ?? '',
      token: json['token'] as String? ?? 'mock_token_${json['id']}',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'token': token,
      };
}
