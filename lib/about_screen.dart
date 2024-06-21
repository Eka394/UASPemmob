import 'package:flutter/material.dart';

class AboutEleganzaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Eleganza'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      size: 100,
                      color: Color.fromARGB(255, 238, 80, 80),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Eleganza v7.5.4',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            _buildListItem(
              'Tentang Eleganza',
              'Eleganza adalah aplikasi untuk pecinta mode yang memungkinkan pengguna untuk menjelajahi dan berbelanja produk fashion terbaru.',
            ),
            _buildDivider(),
            _buildListItem(
              'Visi dan Misi',
              'Visi: Menjadi destinasi utama untuk mode terbaru dan tren gaya.\nMisi: Memberikan pengalaman berbelanja yang menyenangkan dan inspiratif kepada pelanggan kami.',
            ),
            _buildDivider(),
            _buildListItem(
              'Versi Aplikasi',
              'Versi 7.5.4',
            ),              
            _buildDivider(),
            _buildListItem(
              'Aksesibilitas',
              'Kami peduli terhadap aksesibilitas pengguna. Harap hubungi kami jika Anda memiliki pertanyaan atau saran terkait aksesibilitas.',
            ),
            _buildDivider(),
            _buildListItem(
              'Kunjungi Situs Web Kami',
              'Kunjungi situs web kami untuk info lebih lanjut dan penawaran spesial.\nWebsite: www.eleganza.com',
            ),
            _buildDivider(),
            _buildListItem(
              'Ikuti Kami di Media Sosial',
              'Ikuti akun kami di media sosial untuk pembaruan terbaru dan promosi eksklusif.',
            ),
            _buildDivider(),
            _buildListItem(
              'Hak Cipta',
              '© 2024 Eleganza Technologies. Semua hak dilindungi undang-undang.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                content,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildDivider() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
    child: Divider(
      height: 1,
      color: Colors.grey[350],
    ),
  );
}


void main() {
  runApp(MaterialApp(
    home: AboutEleganzaScreen(),
  ));
}
}