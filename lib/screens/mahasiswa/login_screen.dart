import 'package:flutter/material.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController npmController = TextEditingController(); // Untuk NPM
  final TextEditingController passwordController = TextEditingController(); // Untuk Password
  bool isPasswordVisible = false; // Untuk toggle visibility password

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
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 245, 245, 245), // Sesuaikan dengan desain
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
                      constraints: BoxConstraints(maxWidth: 300), // Maksimal lebar
                      child: TextField(
                        controller: npmController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person, color: Colors.blueAccent),
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
                        controller: passwordController,
                        obscureText: !isPasswordVisible,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock, color: Colors.blueAccent),
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
                    // Tombol Lupa Password di bawah password dan agak ke kiri
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0), // Memberikan jarak ke bawah
                      child: Align(
                        alignment: Alignment.center, // Di kiri tapi tidak terlalu ke kiri
                        child: TextButton(
                          onPressed: () {
                            // Tambahkan aksi untuk lupa password
                          },
                          child: Text(
                            'Lupa password?',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Tombol Login
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 2000,  // Lebar tombol lebih besar
                        minHeight: 40,  // Tinggi minimal tombol
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: EdgeInsets.symmetric(vertical: 12.0),  // Menambah padding vertikal
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          // Logic autentikasi di sini
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => DashboardScreen()),
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
