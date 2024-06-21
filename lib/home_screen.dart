import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fashionshop/product_screen.dart';
import 'package:fashionshop/product_screen1.dart';
import 'package:fashionshop/product_screen2.dart';
import 'package:fashionshop/product_screen3.dart';
import 'package:fashionshop/product_screen4.dart';
import 'package:fashionshop/product_screen5.dart';
import 'package:fashionshop/product_screen6.dart';
import 'package:fashionshop/product_screen7.dart';
import 'package:fashionshop/product_screen8.dart';
import 'package:fashionshop/product_screen9.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class Product {
  final String image;
  final String title;
  final String detail;
  final String price;
  final String review;
  final Widget productScreen;

  Product({required this.image, required this.title, required this.detail, required this.price, required this.review, required this.productScreen});
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> tabs = ["New", "Promo", "Top", "Recommended"];
  int selectedIndex = 0;
  List<Product> products = [
  Product(
    image: "assets/image7.jpg",
    title: "Rok A-Line",
    detail: "Rok A-Line adalah pakaian bawahan yang dirancang dengan potongan yang melebar dari pinggang hingga ke bawah.",
    price: "Rp. 74000",
    review: "55",
    productScreen: ProductScreen(), // Ganti dengan layar produk yang sesuai
  ),
  Product(
    image: "assets/image8.jpg",
    title: "Blus Sifon Seri",
    detail: "Blus Sifon Seri adalah atasan yang elegan dan ringan, terbuat dari bahan sifon berkualitas tinggi yang memberikan kesan anggun dan feminin.",
    price: "Rp.88000",
    review: "110",
    productScreen: ProductScreen1(), // Ganti dengan layar produk yang sesuai
  ),
  Product(
    image: "assets/image9.jpg",
    title: "Sweater Rajut",
    detail: "Sweater Rajut adalah pakaian atasan yang dirajut dari benang berkualitas tinggi, memberikan kehangatan dan kenyamanan yang ideal untuk cuaca dingin.",
    price: "Rp.97000",
    review: "234",
    productScreen: ProductScreen2(), // Ganti dengan layar produk yang sesuai
  ),
  Product(
    image: "assets/image10.jpg",
    title: "Celana Chino",
    detail: "Celana Chino adalah pilihan pakaian bawahan yang menawarkan kombinasi sempurna antara kenyamanan dan gaya. celana ini dirancang dengan potongan yang ramping dan modern, memberikan tampilan yang rapi dan serbaguna.",
    price: "Rp.95000",
    review: "32",
    productScreen: ProductScreen3(), // Ganti dengan layar produk yang sesuai
  ),
  Product(
    image: "assets/image11.jpg",
    title: "Blus Bunga",
    detail: "Blus Bunga adalah atasan yang dirancang dengan motif bunga yang cerah dan menawan, menambah sentuhan feminin dan segar pada penampilan anda. ",
    price: "Rp.102000",
    review:  "78",
    productScreen: ProductScreen4(), // Ganti dengan layar produk yang sesuai
  ),
  Product(
    image: "assets/image12.jpg",
    title: "Kaus V-Neck",
    detail: "Kaus V-Neck adalah atasan yang didesain dengan leher berbentuk 'V', memberikan tampilan yang modern dan stylish. Terbuat dari bahan katun yang lembut dan nyaman, kaus ini ideal untuk dipakai sehari-hari.",
    price: "Rp.75000",
    review: "102",
    productScreen: ProductScreen5(), // Ganti dengan layar produk yang sesuai
  ),
  Product(
    image: "assets/image1.jpg",
    title: "Warm Zipper",
    detail: "Warm Zipper adalah jaket atau sweater dengan desain yang dirancang untuk memberikan kehangatan ekstra saat cuaca dingin. Cocok dipakai untuk berbagai aktivitas outdoor atau kegiatan sehari-hari di musim dingin.",
    price: "Rp.75000",
    review: "75",
    productScreen: ProductScreen6(), // Ganti dengan layar produk yang sesuai
  ),
  Product(
    image: "assets/image2.jpg",
    title: "Knit Wool",
    detail: "Knit Wool adalah pakaian rajutan yang terbuat dari wol berkualitas tinggi. Dengan tekstur rajutan yang lembut dan detail yang halus, Knit Wool cocok dipakai untuk gaya santai atau semi-formal.",
    price: "Rp.83000",
    review: "210",
    productScreen: ProductScreen7(), // Ganti dengan layar produk yang sesuai
  ),
  Product(
    image: "assets/image3.jpg",
    title: "Zipper Win",
    detail: "Zipper Win adalah jaket atau pakaian luar dengan desain yang dilengkapi dengan resleting, memberikan kemudahan saat mengenakan atau melepasnya. Zipper Win cocok untuk dipakai dalam berbagai aktivitas outdoor atau perjalanan sehari-hari.",
    price: "Rp.100000",
    review: "105",
    productScreen: ProductScreen8(), // Ganti dengan layar produk yang sesuai
  ),
  Product(
    image: "assets/image4.jpg",
    title: "Child Win",
    detail: "Child Win adalah pakaian atau perlengkapan anak-anak yang dirancang untuk memberikan kenyamanan dan gaya saat beraktivitas sehari-hari. Child Win menjadi pilihan yang tepat untuk menemani anak-anak dalam menjelajahi dunia mereka dengan riang dan gembira.",
    price: "Rp.90000",
    review: "65",
    productScreen: ProductScreen9(), // Ganti dengan layar produk yang sesuai
  ),
];
List<Product> products1 = [
  Product(
    image: "assets/image1.jpg",
    title: "Warm Zipper",
    detail: "Warm Zipper adalah jaket atau sweater dengan desain yang dirancang untuk memberikan kehangatan ekstra saat cuaca dingin. Cocok dipakai untuk berbagai aktivitas outdoor atau kegiatan sehari-hari di musim dingin.",
    price: "Rp.75000",
    review: "75",
    productScreen: ProductScreen6(), // Ganti dengan layar produk yang sesuai
  ),
  Product(
    image: "assets/image2.jpg",
    title: "Knit Wool",
    detail: "Knit Wool adalah pakaian rajutan yang terbuat dari wol berkualitas tinggi. Dengan tekstur rajutan yang lembut dan detail yang halus, Knit Wool cocok dipakai untuk gaya santai atau semi-formal.",
    price: "Rp.83000",
    review: "210",
    productScreen: ProductScreen7(), // Ganti dengan layar produk yang sesuai
  ),
  Product(
    image: "assets/image3.jpg",
    title: "Zipper Win",
    detail: "Zipper Win adalah jaket atau pakaian luar dengan desain yang dilengkapi dengan resleting, memberikan kemudahan saat mengenakan atau melepasnya. Zipper Win cocok untuk dipakai dalam berbagai aktivitas outdoor atau perjalanan sehari-hari.",
    price: "Rp.100000",
    review: "105",
    productScreen: ProductScreen8(), // Ganti dengan layar produk yang sesuai
  ),
  Product(
    image: "assets/image4.jpg",
    title: "Child Win",
    detail: "Child Win adalah pakaian atau perlengkapan anak-anak yang dirancang untuk memberikan kenyamanan dan gaya saat beraktivitas sehari-hari. Child Win menjadi pilihan yang tepat untuk menemani anak-anak dalam menjelajahi dunia mereka dengan riang dan gembira.",
    price: "Rp.90000",
    review: "65",
    productScreen: ProductScreen9(), // Ganti dengan layar produk yang sesuai
  ),
];
List<Product> products2 = [
  Product(
    image: "assets/image7.jpg",
    title: "Rok A-Line",
    detail: "Rok A-Line adalah pakaian bawahan yang dirancang dengan potongan yang melebar dari pinggang hingga ke bawah.  Cocok untuk berbagai acara, mulai dari kasual hingga semi-formal, Rok A-Line mudah dipadukan dengan berbagai jenis atasan.",
    price: "Rp. 74000",
    review: "55",
    productScreen: ProductScreen(), // Ganti dengan layar produk yang sesuai
  ),
  Product(
    image: "assets/image12.jpg",
    title: "Kaus V-Neck",
    detail: "Kaus V-Neck adalah atasan yang didesain dengan leher berbentuk 'V', memberikan tampilan yang modern dan stylish. Terbuat dari bahan katun yang lembut dan nyaman, kaus ini ideal untuk dipakai sehari-hari.",
    price: "Rp.75000",
    review: "102",
    productScreen: ProductScreen5(), // Ganti dengan layar produk yang sesuai
  ),
  Product(
    image: "assets/image1.jpg",
    title: "Warm Zipper",
    detail: "Warm Zipper adalah jaket atau sweater dengan desain yang dirancang untuk memberikan kehangatan ekstra saat cuaca dingin. Cocok dipakai untuk berbagai aktivitas outdoor atau kegiatan sehari-hari di musim dingin.",
    price: "Rp.75000",
    review: "75",
    productScreen: ProductScreen6(), // Ganti dengan layar produk yang sesuai
  ),
  Product(
    image: "assets/image2.jpg",
    title: "Knit Wool",
    detail: "Knit Wool adalah pakaian rajutan yang terbuat dari wol berkualitas tinggi. Dengan tekstur rajutan yang lembut dan detail yang halus, Knit Wool cocok dipakai untuk gaya santai atau semi-formal.",
    price: "Rp.83000",
    review: "210",
    productScreen: ProductScreen7(), // Ganti dengan layar produk yang sesuai
  ),
];
List<Product> products3 = [
  Product(
    image: "assets/image8.jpg",
    title: "Blus Sifon Seri",
    detail: "Blus Sifon Seri adalah atasan yang elegan dan ringan, terbuat dari bahan sifon berkualitas tinggi yang memberikan kesan anggun dan feminin. Cocok untuk acara formal maupun semi-formal.",
    price: "Rp.88000",
    review: "110",
    productScreen: ProductScreen1(), // Ganti dengan layar produk yang sesuai
  ),
  Product(
    image: "assets/image9.jpg",
    title: "Sweater Rajut",
    detail: "Sweater Rajut adalah pakaian atasan yang dirajut dari benang berkualitas tinggi, memberikan kehangatan dan kenyamanan yang ideal untuk cuaca dingin. sweater ini menjadi pilihan favorit untuk tampilan yang cozy dan modis sepanjang hari.",
    price: "Rp.97000",
    review: "234",
    productScreen: ProductScreen2(), // Ganti dengan layar produk yang sesuai
  ),
  Product(
    image: "assets/image3.jpg",
    title: "Zipper Win",
    detail: "Zipper Win adalah jaket atau pakaian luar dengan desain yang dilengkapi dengan resleting, memberikan kemudahan saat mengenakan atau melepasnya. Zipper Win cocok untuk dipakai dalam berbagai aktivitas outdoor atau perjalanan sehari-hari.",
    price: "Rp.100000",
    review: "105",
    productScreen: ProductScreen8(), // Ganti dengan layar produk yang sesuai
  ),
  Product(
    image: "assets/image12.jpg",
    title: "Kaus V-Neck",
    detail: "Kaus V-Neck adalah atasan yang didesain dengan leher berbentuk 'V', memberikan tampilan yang modern dan stylish. Terbuat dari bahan katun yang lembut dan nyaman, kaus ini ideal untuk dipakai sehari-hari.",
    price: "Rp.75000",
    review: "102",
    productScreen: ProductScreen5(), // Ganti dengan layar produk yang sesuai
  ),
];
List<Product> products4 = [
  Product(
    image: "assets/image10.jpg",
    title: "Celana Chino",
    detail: "Celana Chino adalah pilihan pakaian bawahan yang menawarkan kombinasi sempurna antara kenyamanan dan gaya. celana ini dirancang dengan potongan yang ramping dan modern, memberikan tampilan yang rapi dan serbaguna.",
    price: "Rp.95000",
    review: "32",
    productScreen: ProductScreen3(), // Ganti dengan layar produk yang sesuai
  ),
  Product(
    image: "assets/image11.jpg",
    title: "Blus Bunga",
    detail: "Blus Bunga adalah atasan yang dirancang dengan motif bunga yang cerah dan menawan, menambah sentuhan feminin dan segar pada penampilan anda. Dengan pilihan warna yang beragam dan detail yang indah, blus ini menjadi pilihan yang sempurna untuk acara kasual maupun semi-formal.",
    price: "Rp.102000",
    review:  "78",
    productScreen: ProductScreen4(), // Ganti dengan layar produk yang sesuai
  ),
  Product(
    image: "assets/image2.jpg",
    title: "Knit Wool",
    detail: "Knit Wool adalah pakaian rajutan yang terbuat dari wol berkualitas tinggi. Dengan tekstur rajutan yang lembut dan detail yang halus, Knit Wool cocok dipakai untuk gaya santai atau semi-formal.",
    price: "Rp.83000",
    review: "210",
    productScreen: ProductScreen7(), // Ganti dengan layar produk yang sesuai
  ),
  Product(
    image: "assets/image4.jpg",
    title: "Child Win",
    detail: "Child Win adalah pakaian atau perlengkapan anak-anak yang dirancang untuk memberikan kenyamanan dan gaya saat beraktivitas sehari-hari. Child Win menjadi pilihan yang tepat untuk menemani anak-anak dalam menjelajahi dunia mereka dengan riang dan gembira.",
    price: "Rp.90000",
    review: "65",
    productScreen: ProductScreen9(), // Ganti dengan layar produk yang sesuai
  ),
];
void navigateToProductScreen1(BuildContext context, Widget productScreen) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => productScreen,
    ),
  );
}
void navigateToProductScreen(BuildContext context, Widget productScreen) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => productScreen,
    ),
  );
}

  List<String> imageList1 = [
    "assets/image7.jpg",
    "assets/image8.jpg",
    "assets/image9.jpg",
    "assets/image10.jpg",
    "assets/image11.jpg",
    "assets/image12.jpg",
    "assets/image1.jpg",
    "assets/image2.jpg",
    "assets/image3.jpg",
    "assets/image4.jpg",
  ];
  List<String> imageList = [
    "assets/image1.jpg",
    "assets/image2.jpg",
    "assets/image3.jpg",
    "assets/image4.jpg",
  ];
  List<String> detailList = [
    "Warm Zipper adalah jaket atau sweater dengan desain yang dirancang untuk memberikan kehangatan ekstra saat cuaca dingin. Cocok dipakai untuk berbagai aktivitas outdoor atau kegiatan sehari-hari di musim dingin.",
    "Knit Wool adalah pakaian rajutan yang terbuat dari wol berkualitas tinggi. Dengan tekstur rajutan yang lembut dan detail yang halus, Knit Wool cocok dipakai untuk gaya santai atau semi-formal.",
    "Zipper Win adalah jaket atau pakaian luar dengan desain yang dilengkapi dengan resleting, memberikan kemudahan saat mengenakan atau melepasnya. Zipper Win cocok untuk dipakai dalam berbagai aktivitas outdoor atau perjalanan sehari-hari.",
    "Child Win adalah pakaian atau perlengkapan anak-anak yang dirancang untuk memberikan kenyamanan dan gaya saat beraktivitas sehari-hari. Child Win menjadi pilihan yang tepat untuk menemani anak-anak dalam menjelajahi dunia mereka dengan riang dan gembira.",
  ];
  List<String> productTitles1 = [
    "Rok A-Line",
    "Blus Sifon Seri",
    "Sweater Rajut",
    "Celana Chino",
    "Blus Bunga",
    "Kaus V-Neck",
    "Warm Zipper",
    "Knit Wool",
    "Zipper Win",
    "Child Win",
  ];
  List<String> productTitles = [
    "Warm Zipper",
    "Knit Wool",
    "Zipper Win",
    "Child Win",
  ];
  List<String> prices = [
    "Rp.75000",
    "Rp.83000",
    "Rp.100000",
    "Rp.90000",
  ];
  List<String> prices1 = [
    "Rp.74000",
    "Rp.88000",
    "Rp.97000",
    "Rp.95000",
    "Rp.102000",
    "Rp.75000",
    "Rp.75000",
    "Rp.83000",
    "Rp.100000",
    "Rp.90000",
  ];
  List<String> reviews = [
    "75",
    "210",
    "105",
    "65",
  ];
  List<String> reviews1 = [
    "55",
    "110",
    "234",
    "32",
    "78",
    "102",
    "75",
    "210",
    "105",
    "65",
  ];

  // Data untuk tab Promo
  List<String> imageListPromo = [
    "assets/image7.jpg",
    "assets/image12.jpg",
    "assets/image1.jpg",
    "assets/image2.jpg",
  ];
  List<String> detailListPromo = [
    "Rok A-Line adalah pakaian bawahan yang dirancang dengan potongan yang melebar dari pinggang hingga ke bawah.  Cocok untuk berbagai acara, mulai dari kasual hingga semi-formal, Rok A-Line mudah dipadukan dengan berbagai jenis atasan.",
    "Kaus V-Neck adalah atasan yang didesain dengan leher berbentuk 'V', memberikan tampilan yang modern dan stylish. Terbuat dari bahan katun yang lembut dan nyaman, kaus ini ideal untuk dipakai sehari-hari.",
    "Warm Zipper adalah jaket atau sweater dengan desain yang dirancang untuk memberikan kehangatan ekstra saat cuaca dingin. Cocok dipakai untuk berbagai aktivitas outdoor atau kegiatan sehari-hari di musim dingin.",
    "Knit Wool adalah pakaian rajutan yang terbuat dari wol berkualitas tinggi. Dengan tekstur rajutan yang lembut dan detail yang halus, Knit Wool cocok dipakai untuk gaya santai atau semi-formal.",
  ];
  List<String> productTitlesPromo = [
    "Rok A-Line",
    "Kaus V-Neck",
    "Warm Zipper",
    "Knit Wool",
  ];
  List<String> pricesPromo = [
    "Rp.74000",
    "Rp.75000",
    "Rp.75000",
    "Rp.83000",
  ];
  List<String> reviewsPromo = [
    "55",
    "102",
    "75",
    "210",
  ];

  // Data untuk tab Top
  List<String> imageListTop = [
    "assets/image8.jpg",
    "assets/image9.jpg",
    "assets/image3.jpg",
    "assets/image12.jpg",
  ];
  List<String> detailListTop = [
    "Blus Sifon Seri adalah atasan yang elegan dan ringan, terbuat dari bahan sifon berkualitas tinggi yang memberikan kesan anggun dan feminin. Cocok untuk acara formal maupun semi-formal.",
    "Sweater Rajut adalah pakaian atasan yang dirajut dari benang berkualitas tinggi, memberikan kehangatan dan kenyamanan yang ideal untuk cuaca dingin. sweater ini menjadi pilihan favorit untuk tampilan yang cozy dan modis sepanjang hari.",
    "Zipper Win adalah jaket atau pakaian luar dengan desain yang dilengkapi dengan resleting, memberikan kemudahan saat mengenakan atau melepasnya. Zipper Win cocok untuk dipakai dalam berbagai aktivitas outdoor atau perjalanan sehari-hari.",
    "Kaus V-Neck adalah atasan yang didesain dengan leher berbentuk 'V', memberikan tampilan yang modern dan stylish. Terbuat dari bahan katun yang lembut dan nyaman, kaus ini ideal untuk dipakai sehari-hari.",
  ];
  List<String> productTitlesTop = [
    "Blus Sifon Seri",
    "Sweater Rajut",
    "Zipper Win",
    "Kaus V-Neck",
  ];
  List<String> pricesTop = [
    "Rp.88000",
    "Rp.97000",
    "Rp.100000",
    "Rp.75000",
  ];
  List<String> reviewsTop = [
    "110",
    "234",
    "105",
    "102",
  ];

  // Data untuk tab Recommended
  List<String> imageListRecommended = [
    "assets/image10.jpg",
    "assets/image11.jpg",
    "assets/image2.jpg",
    "assets/image4.jpg",
  ];
  List<String> detailListRecommended = [
    "Celana Chino adalah pilihan pakaian bawahan yang menawarkan kombinasi sempurna antara kenyamanan dan gaya. celana ini dirancang dengan potongan yang ramping dan modern, memberikan tampilan yang rapi dan serbaguna.",
    "Blus Bunga adalah atasan yang dirancang dengan motif bunga yang cerah dan menawan, menambah sentuhan feminin dan segar pada penampilan anda. Dengan pilihan warna yang beragam dan detail yang indah, blus ini menjadi pilihan yang sempurna untuk acara kasual maupun semi-formal.",
    "Knit Wool adalah pakaian rajutan yang terbuat dari wol berkualitas tinggi. Dengan tekstur rajutan yang lembut dan detail yang halus, Knit Wool cocok dipakai untuk gaya santai atau semi-formal.",
    "Child Win adalah pakaian atau perlengkapan anak-anak yang dirancang untuk memberikan kenyamanan dan gaya saat beraktivitas sehari-hari. Child Win menjadi pilihan yang tepat untuk menemani anak-anak dalam menjelajahi dunia mereka dengan riang dan gembira.",
  ];
  List<String> productTitlesRecommended = [
    "Celana Chino",
    "Blus Bunga",
    "Knit Wool",
    "Child Win",
  ];
  List<String> pricesRecommended = [
    "Rp.95000",
    "Rp.102000",
    "Rp.83000",
    "Rp.90000",
  ];
  List<String> reviewsRecommended = [
    "32",
    "78",
    "210",
    "65",
  ];
  
  TextEditingController _searchController = TextEditingController();
  List<String> searchResult = [];

  @override
  Widget build(BuildContext context) {
    List<String> currentImageList;
    List<String> currentDetailList;
    List<String> currentProductTitles;
    List<String> currentPrices;
    List<String> currentReviews;

    switch (selectedIndex) {
      case 1:
        currentImageList = imageListPromo;
        currentDetailList = detailListPromo;
        currentProductTitles = productTitlesPromo;
        currentPrices = pricesPromo;
        currentReviews = reviewsPromo;
        break;
      case 2:
        currentImageList = imageListTop;
        currentDetailList = detailListTop;
        currentProductTitles = productTitlesTop;
        currentPrices = pricesTop;
        currentReviews = reviewsTop;
        break;
      case 3:
        currentImageList = imageListRecommended;
        currentDetailList = detailListRecommended;
        currentProductTitles = productTitlesRecommended;
        currentPrices = pricesRecommended;
        currentReviews = reviewsRecommended;
        break;
      default:
        currentImageList = imageList;
        currentDetailList = detailList;
        currentProductTitles = productTitles;
        currentPrices = prices;
        currentReviews = reviews;
    }
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                      color: Colors.black12.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.05),
                          blurRadius: 2,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: _searchController,
                      onChanged: (value) {
                        setState(() {
                          searchResult = productTitles1
                              .where((title) => title.toLowerCase().contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xFFDB3022),
                        ),
                        border: InputBorder.none,
                        labelText: "Find Your Product",
                        labelStyle: TextStyle(),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 6,
                    decoration: BoxDecoration(
                      color: Colors.black12.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.05),
                          blurRadius: 2,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.notifications,
                        color: Color(0xFFDB3022),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFFFF0DD),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset("assets/freed.png"),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: tabs.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        height: 40,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? Color(0xFFDB3022).withOpacity(0.2)
                              : Colors.black12.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              tabs[index],
                              style: TextStyle(
                                color: selectedIndex == index
                              ? Color(0xFFDB3022)
                              : Colors.black38,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 180,
                child: ListView.builder(
                  itemCount: currentImageList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 330,
                      margin: EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 180,
                            width: 170,
                            child: Stack(
                              children: [
                                InkWell(
                                  onTap: () {
        // Periksa kategori yang dipilih oleh pengguna
        switch (selectedIndex) {
          case 0: // Kategori "New"
            navigateToProductScreen(context, products1[index].productScreen);
            break;
          case 1: // Kategori "Promo"
            navigateToProductScreen(context, products2[index].productScreen);
            break;
          case 2: // Kategori "Top"
            navigateToProductScreen(context, products3[index].productScreen);
            break;
          case 3: // Kategori "Recommended"
            navigateToProductScreen(context, products4[index].productScreen);
            break;
          default:
            // Kategori default (misalnya "New")
            navigateToProductScreen(context, products1[index].productScreen);
        }
      },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      currentImageList[index],
                                      fit: BoxFit.cover,
                                      height: 180,
                                      width: 170,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentProductTitles[index],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                SizedBox(
                                  width: 120,
                                  child: Text(
                                    currentDetailList[index],
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 22,
                                    ),
                                    Text(
                                      '(' + currentReviews[index] + ')',
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      currentPrices[index],
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFDB3022),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "All Products",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 7),
              // Inside GridView.builder
GridView.builder(
  itemCount: searchResult.isNotEmpty ? searchResult.length : productTitles1.length,
  shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(),
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 0.6,
    crossAxisSpacing: 10,
  ),
  itemBuilder: (context, index) {
    final String title = searchResult.isNotEmpty ? searchResult[index] : productTitles1[index];
    final String image = searchResult.isNotEmpty ? imageList1[productTitles1.indexOf(title)] : imageList1[index];
    final String review = searchResult.isNotEmpty ? reviews1[productTitles1.indexOf(title)] : reviews1[index];
    final String price = searchResult.isNotEmpty ? prices1[productTitles1.indexOf(title)] : prices1[index];

    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman detail produk dengan data yang sesuai dengan item pencarian
        final int productIndex = productTitles1.indexOf(title);
        if (productIndex != -1) { // Pastikan produk ditemukan dalam daftar produk
          navigateToProductScreen1(context, products[productIndex].productScreen);
        }
      },
      child: Container(
        width: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 170,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  width: 160,
                  fit: BoxFit.cover,
                  height: 170,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 22,
                ),
                Text(
                  '($review)',
                ),
                SizedBox(width: 10),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFDB3022),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  },
),
            ],
          ),
        ),
      ),
    );
  }
}