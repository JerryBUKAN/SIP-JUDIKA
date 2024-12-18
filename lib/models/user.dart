class User {
  final String id;
  final String name;
  final String email;
  final String role; // 'mahasiswa', 'dosen', atau 'admin'

  // Constructor untuk membuat instance User
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
  });

  // Fungsi untuk membuat User dari map (misalnya untuk parsing JSON)
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      role: map['role'],
    );
  }

  // Fungsi untuk mengubah User menjadi map (misalnya untuk menyimpan ke database)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
    };
  }
}
