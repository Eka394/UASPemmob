import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:fashionshop/home_screen.dart';
import 'package:fashionshop/login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  final introKey = GlobalKey<IntroductionScreenState>();
  @override
  Widget build(BuildContext context) {
    final pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
      bodyTextStyle: TextStyle(fontSize: 13),
      bodyPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "Shop Now",
          body:
              "Jelajahi dunia fashion dengan Eleganza, Tempat anda menemukan gaya terbaru dan kekinian yang dihadirkan khusus untuk anda.",
          image: Image.asset(
            "assets/splash1.png",
            width: 200,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Big Discount",
          body:
              "Temukan penawaran luar biasa di Eleganza! Manfaatkan diskon besar-besaran kami untuk mendapatkan gaya terbaru dengan harga yang lebih terjangkau",
          image: Image.asset(
            "assets/splash2.png",
            width: 200,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Affordable Delivery",
          body:
              "Manfaatkan kenyamanan berbelanja di Eleganza dengan pengiriman yang lebih terjangkau! Setiap pembelian anda akan diantar dengan cepat dan aman.",
          image: Image.asset(
            "assets/splash3.png",
            width: 200,
          ),
          decoration: pageDecoration,
          footer: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LoginScreen()), // Ubah tujuan navigasi ini
                  );
                },
                child: Text(
                  "Let's Shop",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 18,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(55),
                  backgroundColor: Color(0xFFEF6969),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
      showSkipButton: false,
      showDoneButton: false,
      showBackButton: true,
      back: Text(
        "Back",
        style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFFEF6969)),
      ),
      next: Text(
        "Next",
        style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFFEF6969)),
      ),
      onDone: () {},
      onSkip: () {},
      dotsDecorator: DotsDecorator(
        size: Size.square(10),
        activeSize: Size(20, 10),
        activeColor: Color(0xFFEF6969),
        color: Colors.black26,
        spacing: EdgeInsets.symmetric(horizontal: 3),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}