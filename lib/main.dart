import 'package:flutter/material.dart';
import 'package:sip_judika/screens/admin/daftar_judul_admin.dart';
import 'package:sip_judika/screens/admin/dashboard_admin.dart';
import 'package:sip_judika/screens/admin/detail_judul_admin.dart';
import 'package:sip_judika/screens/dosen/profil_dosen.dart';
import 'screens/login_screen.dart';
import 'screens/mahasiswa/dashboard_mahasiswa_screen.dart';
import 'screens/mahasiswa/pengajuan_judul_screen.dart';
import 'screens/mahasiswa/status_pengajuan_screen.dart';
import 'screens/mahasiswa/profil_screen.dart';
import 'screens/dosen/dashboard_dosen_screen.dart';
import 'screens/dosen/daftar_judul_dosen.dart';

void main() {
  runApp(const MyApp());
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
        '/login': (context) => const LoginScreen(),
        '/dashboard_mahasiswa': (context) => const DashboardMahasiswaScreen(),
        '/dashboard_dosen': (context) => const DashboardDosenScreen(),
        '/pengajuan_judul_screen': (context) => PengajuanJudulScreen(),
        '/status_pengajuan_screen': (context) => StatusPengajuanScreen(),
        '/profil': (context) => const ProfilScreen(),

        '/daftar_judul': (context) => DaftarJudulDosen(),
        '/profil_dosen': (context) => const ProfilDosenScreen(),
        '/dashboard_admin': (context) => const DashboardAdminScreen(),
        '/daftar_judul_admin': (context) => DaftarJudulAdmin(),
      },
    );
  }
}
