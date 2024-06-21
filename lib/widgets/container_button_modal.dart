import 'package:flutter/material.dart';

class ContainerButtonModel extends StatelessWidget {
  final Color? bgColor;
  final double? containerWidth;
  final String itext;

  const ContainerButtonModel({
    Key? key, // Perhatikan penggunaan Key di sini
    this.bgColor,
    this.containerWidth,
    required this.itext,
  }) : super(key: key); // Tambahkan super(key: key) di sini

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: containerWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: bgColor,
      ),
      child: Center(
        child: Text(
          itext,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
