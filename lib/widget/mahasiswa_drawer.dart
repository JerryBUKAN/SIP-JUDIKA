import 'package:flutter/material.dart';

class MahasiswaDrawer extends StatelessWidget {
  const MahasiswaDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Header Drawer
    final String headerTitle = "Mahasiswa";
    final IconData headerIcon = Icons.person;

    // Menu untuk mahasiswa
    final List<Map<String, dynamic>> menuItems = [
      {"icon": Icons.home, "title": "Dashboard", "route": '/dashboard'},
      {"icon": Icons.edit, "title": "Pengajuan Judul", "route": '/pengajuan_judul_screen'},
      {"icon": Icons.list, "title": "Status Pengajuan", "route": '/status_pengajuan_screen'},
      {"icon": Icons.person, "title": "Profil", "route": '/profil'},
    ];

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Color.fromARGB(255, 23, 77, 124)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(headerIcon, size: 60, color: const Color.fromARGB(255, 243, 243, 243)),
                const SizedBox(height: 8),
                Text(
                  headerTitle,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          // Menu Items untuk mahasiswa
          ...menuItems.map((item) {
            return ListTile(
              leading: Icon(item['icon']),
              title: Text(item['title']),
              onTap: () {
                Navigator.pushReplacementNamed(context, item['route']);
              },
            );
          }).toList(),
          // Log Out
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Log Out"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/login'); // Kembali ke halaman login
            },
          ),
        ],
      ),
    );
  }
}
