import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Center'),
        bottom: TabBar(
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [
            Tab(
              child: Text(
                'FAQ',
                style: TextStyle(fontSize: 17), // Mengatur ukuran teks menjadi 18
              ),
            ),
            Tab(
              child: Text(
                'Contact Us',
                style: TextStyle(fontSize: 17), // Mengatur ukuran teks menjadi 18
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          FAQScreen(searchController: _searchController),
          ContactUsScreen(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class FAQScreen extends StatelessWidget {
  final TextEditingController searchController;

  const FAQScreen({Key? key, required this.searchController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                FAQListItem(
                  title: 'Apa itu Eleganza?',
                  infoText: 'Eleganza adalah platform belanja fashion online yang menyediakan berbagai produk fashion terbaru dan berkualitas.',
                ),
                FAQListItem(
                  title: 'Bagaimana cara membuat akun di Eleganza?',
                  infoText: 'Anda dapat membuat akun di Eleganza dengan mengklik tombol "Daftar" di halaman utama aplikasi dan mengisi formulir pendaftaran.',
                ),
                FAQListItem(
                  title: 'Bisakah saya mengembalikan barang?',
                  infoText: 'Ya, Anda dapat mengembalikan barang yang dibeli dengan mengikuti prosedur pengembalian yang tertera di halaman "Kebijakan Pengembalian".',
                ),
                FAQListItem(
                  title: 'Bagaimana cara mereset kata sandi saya?',
                  infoText: 'Anda dapat mereset kata sandi Anda dengan mengklik tombol "Lupa Kata Sandi" di halaman masuk aplikasi dan mengikuti instruksi yang diberikan.',
                ),
                FAQListItem(
                  title: 'Mengapa saya tidak bisa menambahkan alamat?',
                  infoText: 'Pastikan Anda telah masuk ke dalam akun Anda. Jika masih mengalami masalah, hubungi tim dukungan pelanggan kami.',
                ),
                FAQListItem(
                  title: 'Bagaimana cara menghubungi customer service?',
                  infoText: 'Anda dapat menghubungi customer service kami melalui fitur "Hubungi Kami" di aplikasi atau mengirim email ke support@eleganza.com.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContactUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          FAQListItem(
            title: 'Customer Service',
            infoText: 'Hubungi layanan pelanggan kami untuk bantuan lebih lanjut.\nEmail: support@eleganza.com\nTelepon: 123-456-7890',
          ),
          FAQListItem(
            title: 'WhatsApp',
            infoText: 'Kami juga tersedia di WhatsApp untuk pertanyaan dan bantuan langsung.\nNomor: +1234567890',
          ),
          FAQListItem(
            title: 'Website',
            infoText: 'Kunjungi situs web kami untuk info lebih lanjut dan penawaran spesial.\nWebsite: www.eleganza.com',
          ),
          FAQListItem(
            title: 'Facebook',
            infoText: 'Temukan kami di Facebook untuk berita terbaru dan konten eksklusif.\nFacebook: EleganzaFashion',
          ),
          FAQListItem(
            title: 'Twitter',
            infoText: 'Ikuti kami di Twitter untuk pembaruan real-time dan diskusi.\nTwitter: @EleganzaFashion',
          ),
          FAQListItem(
            title: 'Instagram',
            infoText: 'Ikuti akun Instagram kami untuk inspirasi gaya dan promosi eksklusif.\nInstagram: @EleganzaFashion',
          ),
        ],
      ),
    );
  }
}

class FAQListItem extends StatefulWidget {
  final String title;
  final String infoText;

  const FAQListItem({Key? key, required this.title, required this.infoText}) : super(key: key);

  @override
  _FAQListItemState createState() => _FAQListItemState();
}

class _FAQListItemState extends State<FAQListItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
              ],
            ),
          ),
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                widget.infoText,
                style: TextStyle(color: Colors.black),
              ),
            ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HelpScreen(),
  ));
}
