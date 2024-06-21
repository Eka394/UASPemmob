import 'package:flutter/material.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fashionshop/widgets/container_button_modal.dart';
import 'package:fashionshop/cart_screen.dart';
import 'package:fashionshop/checkout_screen.dart';
import 'package:fashionshop/models.dart';

class ProductScreen6 extends StatelessWidget {
  List<String> images = [
    "assets/image1.jpg",
    "assets/image1.1.jpg",
    "assets/image1.2.jpg",
    "assets/image1.3.jpg"
  ]; 
  final TextStyle iStyle = TextStyle(
    color: Colors.black87,
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );

  final List<String> sizes = ["S", "M", "L", "XL"];
  final List<String> colors = ["Red", "Blue", "Green", "Black"];

  final List<Map<String, dynamic>> reviews = [
    {
      "user": "Zellynaa12",
      "image": "assets/user1.jpg",
      "rating": 4.5,
      "review": "This is a fantastic skirt! The fit is great and the material is of high quality."
    },
    {
      "user": "Sabrina34",
      "image": "assets/user2.jpg",
      "rating": 4.0,
      "review": "I love the color and style, but it could be a bit longer."
    },
    {
      "user": "Yoonaa83",
      "image": "assets/user3.jpg",
      "rating": 3.5,
      "review": "The skirt is nice, but the size runs a bit small."
    }
  ];
  double totalPrice = 75000; // Harga awal
  int quantity = 1; // Jumlah awal

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      child: FanCarouselImageSlider(
                        sliderHeight: 350,
                        autoPlay: true,
                        imagesLink: images,
                        isAssets: true,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(
                              "Warm Zipper",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w900,
                                fontSize: 25,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Zippered Jacket",
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Rp.75,000",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Color(0xFFDB3022),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RatingBar.builder(
                        initialRating: 4.0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 25,
                        itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          // Handle rating update
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Warm Zipper adalah jaket atau sweater dengan desain yang dirancang untuk memberikan kehangatan ekstra saat cuaca dingin.",
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Available Sizes",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: sizes.map((size) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Chip(
                            label: Text(size),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Available Colors",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: colors.map((color) {
                        Color borderColor;
                        Color textColor;

                        switch (color.toLowerCase()) {
                          case 'black':
                            borderColor = Colors.black;
                            textColor = Colors.black;
                            break;
                          case 'red':
                            borderColor = Colors.red;
                            textColor = Colors.red;
                            break;
                          case 'blue':
                            borderColor = Colors.indigo;
                            textColor = Colors.indigo;
                            break;
                          case 'yellow':
                            borderColor = Colors.yellow;
                            textColor = Colors.yellow;
                            break;
                          default:
                            borderColor = Colors.green;
                            textColor = Colors.green;
                        }

                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: borderColor, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            color,
                            style: TextStyle(color: textColor),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Rating & Reviews",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: reviews.map((review) {
                        final String user = review['user'] ?? '';
                        final String image = review['image'] ?? '';
                        final double rating = review['rating'] ?? 0.0;
                        final String reviewText = review['review'] ?? '';

                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(image),
                            radius: 25,
                          ),
                          title: Text(user),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RatingBar.builder(
                                initialRating: rating,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 15,
                                ignoreGestures: true,
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  // Handle rating update
                                },
                              ),
                              SizedBox(height: 5),
                              Text(reviewText),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
  onTap: () {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        String selectedSize = sizes[0];
        String selectedColor = colors[0];
        int quantity = 1;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: MediaQuery.of(context).size.height / 2.1,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Size: ", style: iStyle),
                                SizedBox(height: 40,width: 5,),
                                Text("Color: ", style: iStyle),
                                SizedBox(height: 37,width: 5,),
                                Text("Total: ", style: iStyle),
                                SizedBox(height: 10,width: 5,),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: sizes.map((size) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                                  child: ChoiceChip(
                                    label: Text(size),
                                    selected: selectedSize == size,
                                    onSelected: (bool selected) {
                                      setState(() {
                                        selectedSize = selected ? size : selectedSize;
                                      });
                                    },
                                  ),
                                );
                              }).toList(),
                            ),
                            SizedBox(height: 18),
                            Row(
                              children: colors.map((color) {
                                Color borderColor;
                                Color textColor;

                                switch (color.toLowerCase()) {
                                  case 'black':
                                    borderColor = Colors.black;
                                    textColor = Colors.black;
                                    break;
                                  case 'red':
                                    borderColor = Colors.red;
                                    textColor= Colors.red;
                                    break;
                                  case 'blue':
                                    borderColor = Colors.indigo;
                                    textColor = Colors.indigo;
                                    break;
                                  case 'yellow':
                                    borderColor = Colors.yellow;
                                    textColor = Colors.yellow;
                                    break;
                                  default:
                                    borderColor = Colors.green;
                                    textColor = Colors.green;
                                }

                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 2.0),
                                  child: ChoiceChip(
                                    label: Container(
                                      width: 32, // Set the width as needed
                                      child: Center(child: Text(color)),
                                    ),
                                    selected: selectedColor == color,
                                    onSelected: (bool selected) {
                                      setState(() {
                                        selectedColor = color;
                                      });
                                    },
                                  ),
                                );

                              }).toList(),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (quantity > 1) {
                                        quantity--;
                                        totalPrice -= 75000; // Decrease total price
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 33,
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text("-", style: iStyle),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Container(
                                  width: 50,
                                  height: 33,
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(quantity.toString(), style: iStyle),
                                ),
                                SizedBox(width: 20),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      quantity++;
                                      totalPrice += 75000; // Increase total price
                                    });
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 33,
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text("+", style: iStyle),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Payment", style: iStyle),
                        Text(
                          "Rp.${totalPrice.toStringAsFixed(2)}", // Ubah harga yang ditampilkan
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFDB3022),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        SelectedProduct selectedProduct = SelectedProduct(
                          productImage: "assets/image1.jpg",
                          productName: "Warm Zipper",
                          selectedSize: selectedSize,
                          selectedColor: selectedColor,
                          quantity: quantity,
                          price: totalPrice,
                        );
                        Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => CartScreen(selectedProduct: selectedProduct),
                                              ),
                                            );
                      },
                      child: ContainerButtonModel(
                        containerWidth: MediaQuery.of(context).size.width,
                        itext: "Add Cart",
                        bgColor: Color(0xFFDB3022),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  },
  
  child: Container(
    height: 60,
    width: 60,
    decoration: BoxDecoration(
      color: Color(0x1F989797),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Center(
      child: Icon(
        Icons.shopping_cart,
        color: Color(0xFFDB3022),
      ),
    ),
  ),
),

                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            String selectedSize = sizes[0];
                            String selectedColor = colors[0];
                            int quantity = 1;

                            return StatefulBuilder(
                              builder: (BuildContext context, StateSetter setState) {
                                return Container(
                                  height: MediaQuery.of(context).size.height / 2.1,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
                                              child: Container(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Size: ", style: iStyle),
                                                    SizedBox(height: 40,width: 5,),
                                                    Text("Color: ", style: iStyle),
                                                    SizedBox(height: 37,width: 5,),
                                                    Text("Total: ", style: iStyle),
                                                    SizedBox(height: 10,width: 5,),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 15),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: sizes.map((size) {
                                                    return Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                                                      child: ChoiceChip(
                                                        label: Text(size),
                                                        selected: selectedSize == size,
                                                        onSelected: (bool selected) {
                                                          setState(() {
                                                            selectedSize = selected ? size : selectedSize;
                                                          });
                                                        },
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                                SizedBox(height: 18),
                                                Row(
                                                  children: colors.map((color) {
                                                    Color borderColor;
                                                    Color textColor;

                                                    switch (color.toLowerCase()) {
                                                      case 'black':
                                                        borderColor = Colors.black;
                                                        textColor = Colors.black;
                                                        break;
                                                      case 'red':
                                                        borderColor = Colors.red;
                                                        textColor= Colors.red;
                                                        break;
                                                      case 'blue':
                                                        borderColor = Colors.indigo;
                                                        textColor = Colors.indigo;
                                                        break;
                                                      case 'yellow':
                                                        borderColor = Colors.yellow;
                                                        textColor = Colors.yellow;
                                                        break;
                                                      default:
                                                        borderColor = Colors.green;
                                                        textColor = Colors.green;
                                                    }

                                                    return Padding(
  padding: EdgeInsets.symmetric(horizontal: 2.0),
  child: ChoiceChip(
    label: Container(
      width: 32, // Set the width as needed
      child: Center(child: Text(color)),
    ),
    selected: selectedColor == color,
    onSelected: (bool selected) {
      setState(() {
        selectedColor = color;
      });
    },
  ),
);

                                                  }).toList(),
                                                ),
                                                SizedBox(height: 20),
                                                Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          if (quantity > 1) {
                                                            quantity--;
                                                            totalPrice -= 75000; // Decrease total price
                                                          }
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 40,
                                                        height: 33,
                                                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                        decoration: BoxDecoration(
                                                          border: Border.all(color: Colors.grey),
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                        alignment: Alignment.center,
                                                        child: Text("-", style: iStyle),
                                                      ),
                                                    ),
                                                    SizedBox(width: 20),
                                                    Container(
                                                      width: 50,
                                                      height: 33,
                                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(color: Colors.grey),
                                                        borderRadius: BorderRadius.circular(10),
                                                      ),
                                                      alignment: Alignment.center,
                                                      child: Text(quantity.toString(), style: iStyle),
                                                    ),
                                                    SizedBox(width: 20),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          quantity++;
                                                          totalPrice += 75000; // Increase total price
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 40,
                                                        height: 33,
                                                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                        decoration: BoxDecoration(
                                                          border: Border.all(color: Colors.grey),
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                        alignment: Alignment.center,
                                                        child: Text("+", style: iStyle),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 30),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Total Payment", style: iStyle),
                                            Text(
                                              "Rp.${totalPrice.toStringAsFixed(2)}", // Ubah harga yang ditampilkan
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFFDB3022),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20),
                                        InkWell(
                                          onTap: () {
                        SelectedProduct selectedProduct = SelectedProduct(
                          productImage: "assets/image1.jpg",
                          productName: "Warm Zipper",
                          selectedSize: selectedSize,
                          selectedColor: selectedColor,
                          quantity: quantity,
                          price: totalPrice,
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckoutScreen(selectedProduct: selectedProduct),
                          ),
                        );
                      },
                                          child: ContainerButtonModel(
                                            containerWidth: MediaQuery.of(context).size.width,
                                            itext: "Checkout",
                                            bgColor: Color(0xFFDB3022),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          color: Color(0xFFDB3022),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "Buy Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
