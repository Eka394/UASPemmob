import 'package:flutter/material.dart';

class PaymentDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Metode Pembayaran'),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (BuildContext context, int index) {
          // Buat daftar metode pembayaran beserta gambar
          final List<Map<String, dynamic>> metodePembayaran = [
            {'nama': 'GoPay', 'gambar': 'assets/gopay.png'},
            {'nama': 'OVO', 'gambar': 'assets/ovo.jpg'},
            {'nama': 'DANA', 'gambar': 'assets/dana.jpg'},
            {'nama': 'LinkAja', 'gambar': 'assets/linkaja.png'},
            {'nama': 'ShopeePay', 'gambar': 'assets/shopeepay.png'},
            {'nama': 'BNI', 'gambar': 'assets/bni.png'},
            {'nama': 'BRI', 'gambar': 'assets/bri.png'},
            {'nama': 'BCA', 'gambar': 'assets/bca.png'},
          ];

          return ListTile(
            leading: Image.asset(
              metodePembayaran[index]['gambar'],
              width: 60, // Atur lebar gambar
              height: 50, // Atur tinggi gambar
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(metodePembayaran[index]['nama'],
                style: TextStyle(fontWeight: FontWeight.bold),),
                Text(
                  'Connected',
                  style: TextStyle(
                    color: Colors.green, // Atur warna teks menjadi hijau
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          // Tambahkan garis pemisah di antara setiap elemen daftar
          return Divider();
        },
        itemCount: 8, // Jumlah item dalam daftar metode pembayaran
      ),
    );
  }
}
