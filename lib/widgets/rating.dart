import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';

class RatingWidget extends StatelessWidget {
  final int soldNumber;

  const RatingWidget({super.key, required this.soldNumber});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RatingBar.builder(
                initialRating: 5,
                minRating: 5,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding:  EdgeInsets.only(left: 1.sw),
                itemSize: 4.sw,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber
                ), onRatingUpdate: (_) {  },
              ),
              SizedBox(width: 2.sw,),
              Text('| Sold: $soldNumber',
              style: TextStyle(fontSize: 3.sw),)
            ],
          )
        ],
      ),
    );
  }
}