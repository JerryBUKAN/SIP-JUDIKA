import 'package:flutter/material.dart';
// import '../screens/mahasiswa/status_pengajuan_screen.dart';
// import '../screens/mahasiswa/pengajuan_judul_screen.dart';
// import '../screens/mahasiswa/profil_screen.dart';

class MahasiswaDrawer extends StatelessWidget {
  const MahasiswaDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color.fromARGB(255, 23, 77, 124)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person, size: 60, color: Color.fromARGB(255, 243, 243, 243)),
                SizedBox(height: 8),
                Text(
                  "Mahasiswa",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Dashboard"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/dashboard');
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text("Pengajuan Judul"),
            onTap: () {
              Navigator.pushNamed(context, '/pengajuanJudul');
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text("Status Pengajuan"),
            onTap: () {
              Navigator.pushNamed(context, '/statusPengajuan');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profil"),
            onTap: () {
              Navigator.pushNamed(context, '/profil');
            },
          ),
        ],
      ),
    );
  }
}
