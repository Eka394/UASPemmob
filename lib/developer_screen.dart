import 'package:flutter/material.dart';

class DeveloperScreen extends StatefulWidget {
  const DeveloperScreen({Key? key}) : super(key: key);

  @override
  _DeveloperScreenState createState() => _DeveloperScreenState();
}

class _DeveloperScreenState extends State<DeveloperScreen> with SingleTickerProviderStateMixin {
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
        title: Text('Developer Info'),
        bottom: TabBar(
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [
            Tab(
              child: Text(
                'Ketua',
                style: TextStyle(fontSize: 17), // Mengatur ukuran teks menjadi 18
              ),
            ),
            Tab(
              child: Text(
                'Anggota',
                style: TextStyle(fontSize: 17), // Mengatur ukuran teks menjadi 18
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          KetuaScreen(searchController: _searchController),
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

class KetuaScreen extends StatelessWidget {
  final TextEditingController searchController;

  const KetuaScreen({Key? key, required this.searchController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/vivi.png'),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                KetuaListItem(
                  title: 'Nama',
                  infoText: 'Vivi Eka Juliatus Sholihah',
                ),
                KetuaListItem(
                  title: 'NPM',
                  infoText: '22082010037',
                ),
                KetuaListItem(
                  title: 'TTL',
                  infoText: 'Gresik, 20 Juli 2004',
                ),
                KetuaListItem(
                  title: 'Alamat',
                  infoText: 'Gang XII, Desa Gosari, Ujungpangkah, Gresik, Jawa Timur',
                ),
                KetuaListItem(
                  title: 'No.Hp',
                  infoText: '082143547299',
                ),
                KetuaListItem(
                  title: 'Github',
                  infoText: 'https://github.com/Eka394',
                ),
                KetuaListItem(
                  title: 'Instagram',
                  infoText: '@viviiiekaa_',
                ),
                KetuaListItem(
                  title: 'Email',
                  infoText: '22082010037@student.upnjatim.ac.id',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/amanda.jpg'),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                KetuaListItem(
                  title: 'Nama',
                  infoText: 'Amanda Putri Azzahra',
                ),
                KetuaListItem(
                  title: 'NPM',
                  infoText: '22082010031',
                ),
                KetuaListItem(
                  title: 'TTL',
                  infoText: 'Ngawi, 5 Mei 2005',
                ),
                KetuaListItem(
                  title: 'Alamat',
                  infoText: 'Dusun Sidorejo, Desa Sidolaju, Widodaren, Ngawi, Jawa Timur',
                ),
                KetuaListItem(
                  title: 'No.Hp',
                  infoText: '085806746845',
                ),
                KetuaListItem(
                  title: 'Github',
                  infoText: 'https://github.com/amandaputriazzahra',
                ),
                KetuaListItem(
                  title: 'Instagram',
                  infoText: '@sayaamandaa_',
                ),
                KetuaListItem(
                  title: 'Email',
                  infoText: '22082010031@student.upnjatim.ac.id',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class KetuaListItem extends StatefulWidget {
  final String title;
  final String infoText;

  const KetuaListItem({Key? key, required this.title, required this.infoText}) : super(key: key);

  @override
  _KetuaListItemState createState() => _KetuaListItemState();
}

class _KetuaListItemState extends State<KetuaListItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
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
    home: DeveloperScreen(),
  ));
}
