import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tanggal Efektif: 10 Juni 2024',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              '1. Informasi Pribadi:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            SizedBox(height: 10),
            Text(
              'Kami mengumpulkan dan memproses informasi pribadi, termasuk namun tidak terbatas pada nama, email, dan alamat, untuk menyediakan layanan kami.',
            ),
            SizedBox(height: 20),
            Text(
              '2. Penggunaan Data:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            SizedBox(height: 10),
            Text(
              'Data yang dikumpulkan digunakan untuk pemrosesan pesanan, rekomendasi yang dipersonalisasi, dan meningkatkan pengalaman pengguna.',
            ),
            SizedBox(height: 20),
            Text(
              '3. Layanan Pihak Ketiga:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            SizedBox(height: 10),
            Text(
              'Eleganza dapat menggunakan layanan pihak ketiga untuk pembayaran, dan pengiriman. Tinjau kebijakan privasi mereka untuk detailnya.',
            ),
            SizedBox(height: 20),
            Text(
              '4. Cookies:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            SizedBox(height: 10),
            Text(
              'Kami menggunakan cookies untuk meningkatkan pengalaman pengguna dan melacak penggunaan situs web. Pengguna dapat mengelola preferensi cookie di pengaturan browser mereka.',
            ),
            SizedBox(height: 20),
            Text(
              '5. Tindakan Keamanan:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            SizedBox(height: 10),
            Text(
              'Eleganza menerapkan langkah-langkah keamanan standar industri untuk melindungi data pengguna. Namun, keamanan tidak dapat dijamin sepenuhnya karena risiko pengiriman data melalui internet.',
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PrivacyPolicyScreen(),
  ));
}
