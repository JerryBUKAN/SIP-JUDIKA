import 'package:flutter/material.dart';
import 'package:flutter_create_sip_judika/widget/mahasiswa_drawer.dart';
import 'pengajuan_judul_screen.dart';
import 'status_pengajuan_screen.dart';

class DashboardScreen extends StatelessWidget {
  final bool isJudulSubmitted = false; // Set false jika belum mengajukan judul, true jika sudah

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard Mahasiswa"),
      ),
      drawer: MahasiswaDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Teks sambutan dengan gaya menarik
              Text(
                "Selamat Datang, Mahasiswa!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 20),
              // Subjudul atau deskripsi
              Text(
                "Pilih opsi berikut sesuai dengan status pengajuan judul skripsi Anda.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 40),
              // Card untuk tombol pengajuan atau status
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 250), // Membatasi lebar maksimal
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: InkWell(
                    onTap: () {
                      // Jika status pengajuan sudah ada
                      if (isJudulSubmitted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StatusPengajuanScreen()),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PengajuanJudulScreen()),
                        );
                      }
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Mengurangi padding
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: isJudulSubmitted ? Colors.green : Colors.blueAccent,
                      ),
                      child: Column(
                        children: [
                          Icon(
                            isJudulSubmitted ? Icons.check_circle : Icons.edit,
                            size: 30, // Ukuran icon yang lebih kecil
                            color: Colors.white,
                          ),
                          SizedBox(height: 8),
                          Text(
                            isJudulSubmitted
                                ? "Lihat Status Pengajuan Judul"
                                : "Ajukan Judul Skripsi",
                            style: TextStyle(
                              fontSize: 16, // Ukuran font lebih kecil
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Tombol keluar atau opsi lainnya (opsional)
              // ElevatedButton(
              //   onPressed: () {
              //     // Logika untuk keluar atau opsi lainnya
              //   },
              //   child: Text("Logout"),
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.redAccent,
              //     padding: EdgeInsets.symmetric(vertical: 14, horizontal: 40),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
