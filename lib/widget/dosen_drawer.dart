import 'package:flutter/material.dart';

class DosenDrawer extends StatelessWidget {
  const DosenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Header Drawer
    final String headerTitle = "Dosen";
    final IconData headerIcon = Icons.person;

    // Menu untuk mahasiswa
    final List<Map<String, dynamic>> menuItems = [
      {"icon": Icons.home, "title": "Dashboard", "route": '/dashboard_dosen'},
      // {"icon": Icons.edit, "title": "Pengajuan Judul", "route": '/pengajuan_judul_screen'},
      {"icon": Icons.list, "title": "Daftar Judul", "route": '/daftar_judul'},
      {"icon": Icons.person, "title": "Profil", "route": '/profil_dosen'},
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
