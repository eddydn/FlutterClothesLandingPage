import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    super.key,
    required this.oldPrice,
    required this.newPrice
  });

  final String oldPrice;
  final String newPrice;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Waxed Touring Jacket',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 6.sw),
          ),
          SizedBox(
            width: 2.sw,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                oldPrice,
                maxLines: 1,
                style: TextStyle(fontSize: 6.sw, decoration: TextDecoration.lineThrough),
              ),
              Text(
                newPrice,
                maxLines: 1,
                style: TextStyle(fontSize: 6.sw, color: Colors.red),
              ),
            ],
          )
        ],
      ),
    );
  }
}