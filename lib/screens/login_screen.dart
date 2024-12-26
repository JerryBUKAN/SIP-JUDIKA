import 'package:flutter/material.dart';
import 'package:sip_judika/screens/admin/dashboard_admin.dart';
import 'package:sip_judika/screens/dosen/dashboard_dosen_screen.dart';
import 'package:sip_judika/screens/mahasiswa/dashboard_mahasiswa_screen.dart';
import 'package:sip_judika/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _selectedUserType; // Untuk menyimpan tipe user yang dipilih
  final List<String> _userTypes = [
    'Mahasiswa',
    'Dosen',
    'Admin'
  ]; // Opsi tipe user

  final _authService = AuthService();
  bool isPasswordVisible = false; // Untuk toggle visibility password
  bool _isLoading = false;

  void _login() async {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('NIDN/NPM dan Password wajib diisi')),
      );
      return;
    }
    if (_selectedUserType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Tipe user wajib dipilih')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final user = await _authService.login(_usernameController.text,
          _passwordController.text, _selectedUserType);

      if (user != null) {
        if (user.role == 'mahasiswa') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DashboardMahasiswaScreen(user: user),
            ),
          );
        } else if (user.role == 'dosen') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const DashboardDosenScreen()),
          );
        } else if (user.role == 'admin') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const DashboardAdminScreen()),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login Gagal')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Latar belakang dengan gambar
          Positioned.fill(
            child: Image.asset(
              'asset/images/background1.jpg', // Gambar latar belakang
              fit: BoxFit.cover,
            ),
          ),
          // Konten utama
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Logo
                    Image.asset(
                      'asset/images/logo1.png',
                      width: 150,
                      height: 150,
                    ),
                    SizedBox(height: 18),
                    // Judul
                    Text(
                      "Sistem Pengajuan Judul Informatika",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(
                            255, 245, 245, 245), // Sesuaikan dengan desain
                      ),
                    ),
                    SizedBox(height: 8),
                    // Text(
                    //   "Sistem Pengajuan Judul Skripsi Informatika",
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontSize: 16,
                    //     color: const Color.fromARGB(255, 255, 252, 252),
                    //   ),
                    // ),
                    SizedBox(height: 20),

                    // Input NPM
                    ConstrainedBox(
                      constraints:
                          BoxConstraints(maxWidth: 300), // Maksimal lebar
                      child: TextField(
                        controller: _usernameController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.person, color: Colors.blueAccent),
                          labelText: "NIDN/NPM",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Input Password
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 300),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: !isPasswordVisible,
                        decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.lock, color: Colors.blueAccent),
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.blueAccent,
                            ),
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 300),
                      child: DropdownButtonFormField<String>(
                        value: _selectedUserType,
                        items: _userTypes.map((String type) {
                          return DropdownMenuItem<String>(
                            value: type,
                            child: Text(type),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          labelText: "Pilih Tipe User",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedUserType = newValue;
                          });
                        },
                        validator: (value) =>
                            value == null ? 'Tipe user wajib dipilih' : null,
                      ),
                    ),

                    SizedBox(height: 20),

                    // Tombol Login
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 2000, // Lebar tombol lebih besar
                        minHeight: 40, // Tinggi minimal tombol
                      ),
                      child: _isLoading
                          ? CircularProgressIndicator()
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _isLoading
                                    ? Colors.grey
                                    : Colors.blueAccent,
                                padding: EdgeInsets.symmetric(
                                    vertical: 12.0,
                                    horizontal:
                                        20.0), // Menambah padding vertikal
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              onPressed: _login,
                              child: Text(
                                _isLoading ? "Loading..." : "Login",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      _isLoading ? Colors.black : Colors.white,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
