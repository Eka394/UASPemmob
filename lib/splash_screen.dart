import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fashionshop3/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.black,
            image: const DecorationImage(
              image: AssetImage("assets/image2.jpg"),
              fit: BoxFit.cover,
              opacity: 0.4,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OnboardingScreen()),
                  );
                },
                child: const Icon(
                  Icons.shopping_cart,
                  size: 200,
                  color: Color.fromARGB(255, 238, 80, 80),
                ),
              ),
              const Text(
                "ELEGANZA",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}