import 'package:flutter/material.dart';
// import '../screens/mahasiswa/status_pengajuan_screen.dart';
// import '../screens/mahasiswa/pengajuan_judul_screen.dart';
// import '../screens/mahasiswa/profil_screen.dart';

class MahasiswaDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person, size: 60, color: Colors.white),
                SizedBox(height: 8),
                Text(
                  "Mahasiswa",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Dashboard"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/dashboard');
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text("Pengajuan Judul"),
            onTap: () {
              Navigator.pushNamed(context, '/pengajuanJudul');
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text("Status Pengajuan"),
            onTap: () {
              Navigator.pushNamed(context, '/statusPengajuan');
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profil"),
            onTap: () {
              Navigator.pushNamed(context, '/profil');
            },
          ),
        ],
      ),
    );
  }
}
