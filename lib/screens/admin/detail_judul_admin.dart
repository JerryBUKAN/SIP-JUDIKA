import 'package:flutter/material.dart';

class DetailJudulAdmin extends StatelessWidget {
  const DetailJudulAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Judul",
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255)), // Warna teks hitam
        ),
        backgroundColor:
            const Color.fromARGB(255, 0, 0, 0), // Warna latar belakang AppBar
        iconTheme: const IconThemeData(color: Colors.black), // Ikon hitam
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(
                  255, 255, 255, 255)), // Tombol kembali warna hitam
          onPressed: () {
            // Kembali ke halaman daftar judul
            Navigator.pushReplacementNamed(context, '/daftar_judul');
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 230, 244, 255),
              const Color.fromARGB(255, 244, 247, 255)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),

                      // Judul Penelitian
                      _buildDetailInfo("Judul Penelitian",
                          "Pengembangan Sistem Informasi Pengajuan Judul Skripsi"),
                      const SizedBox(height: 16),

                      // Objek Penelitian
                      _buildDetailInfo("Objek Penelitian",
                          "Mahasiswa Informatika Semester Akhir"),
                      const SizedBox(height: 16),

                      // Latar Belakang Singkat
                      _buildDetailInfo(
                        "Latar Belakang",
                        "Pengajuan judul skripsi seringkali memakan waktu lama karena proses manual, sehingga diperlukan sistem informasi untuk mempercepat proses tersebut.",
                      ),
                      const SizedBox(height: 16),

                      // Tujuan Penelitian
                      _buildDetailInfo(
                        "Tujuan Penelitian",
                        "Meningkatkan efisiensi proses pengajuan judul skripsi dengan menyediakan sistem yang terintegrasi.",
                      ),
                      const SizedBox(height: 16),

                      // Daftar Pustaka Utama
                      _buildDetailInfo(
                        "Daftar Pustaka Utama",
                        "1. Sommerville, I. (2015). Software Engineering.\n"
                            "2. Pressman, R. S. (2014). Software Engineering: A Practitioner's Approach.\n"
                            "3. Sugiyono. (2018). Metode Penelitian Kuantitatif dan Kualitatif.",
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),

              // Tombol Edit dan Hapus
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Logika untuk mengedit judul
                      Navigator.pushNamed(
                          context, '/edit_judul'); // Arahkan ke halaman edit
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("Edit",
                        style: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Logika untuk menghapus judul
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Konfirmasi",
                              style: TextStyle(color: Colors.black)),
                          content: const Text(
                              "Apakah Anda yakin ingin menghapus judul ini?",
                              style: TextStyle(color: Colors.black)),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Batal",
                                  style: TextStyle(color: Colors.black)),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Judul berhasil dihapus!",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255))),
                                  ),
                                );
                              },
                              child: const Text("Hapus",
                                  style: TextStyle(color: Colors.black)),
                            ),
                          ],
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("Hapus",
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailInfo(String title, String content) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Warna hitam untuk judul
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black, // Warna hitam untuk isi konten
              ),
            ),
          ],
        ),
      ),
    );
  }
}
