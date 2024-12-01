import 'package:flutter/material.dart';
import 'screens/mahasiswa/login_screen.dart';
import 'screens/mahasiswa/dashboard_screen.dart';
import 'screens/mahasiswa/pengajuan_judul_screen.dart';
import 'screens/mahasiswa/status_pengajuan_screen.dart';
import 'screens/mahasiswa/profil_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistem Pengajuan Judul Skripsi',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login',
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      routes: {
        '/login': (context) => LoginScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/pengajuanJudul': (context) => PengajuanJudulScreen(),
        '/statusPengajuan': (context) => StatusPengajuanScreen(),
        '/profil': (context) => ProfilScreen(),
      },
    );
  }
}
