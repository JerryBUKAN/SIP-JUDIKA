class User {
  final int id;
  final String name;
  final String username;
  final String role;
  final dynamic detail;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.role,
    this.detail,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['nama'],
      username: json['username'],
      role: json['role'],
      detail: json['detail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'role': role,
      'detail': detail,
    };
  }
}
