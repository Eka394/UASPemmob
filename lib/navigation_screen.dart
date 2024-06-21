import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashionshop/cart_screen.dart';
import 'package:fashionshop/chatbot_screen.dart';
import 'package:fashionshop/home_screen.dart';
import 'package:fashionshop/profile_screen.dart';
import 'package:fashionshop/models.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int pageIndex = 0;
  late SelectedProduct selectedProduct;
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    selectedProduct = SelectedProduct(
      productImage: '',
      productName: '',
      selectedSize: '',
      selectedColor: '',
      quantity: 0,
      price: 0,
    );
    
    pages = [
      HomeScreen(),
      CartScreen(selectedProduct: selectedProduct),
      ChatbotScreen(),
      ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  icon: Icon(
                    CupertinoIcons.home,
                    color: pageIndex == 0 ? Color(0xFFDB3022) : Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  icon: Icon(
                    CupertinoIcons.cart,
                    color: pageIndex == 1 ? Color(0xFFDB3022) : Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      pageIndex = 2;
                    });
                  },
                  icon: Icon(
                    CupertinoIcons.chat_bubble,
                    color: pageIndex == 2 ? Color(0xFFDB3022) : Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      pageIndex = 3;
                    });
                  },
                  icon: Icon(
                    CupertinoIcons.profile_circled,
                    color: pageIndex == 3 ? Color(0xFFDB3022) : Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
