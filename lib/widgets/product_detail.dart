import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProductDetail extends StatelessWidget {
  final ExpansionTileController controller;
  final String text;
  final String title;

  const ProductDetail(
      {super.key, required this.title, required this.controller, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 100.sw,
            child: ExpansionTile(
              controller: controller,
              title:  Text(title, style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),),
              children: [
                Builder(
                  builder: (context) {
                    return Text(
                      text,
                      textAlign: TextAlign.left,
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
