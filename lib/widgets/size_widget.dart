import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SizeWidget extends StatelessWidget {
  final List<String> sizes;

  const SizeWidget({super.key, required this.sizes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.sh,
            width: 100.sw,
            child: ListView.builder(
                primary: false,
                scrollDirection: Axis.horizontal,
                itemCount: sizes.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Center(
                          child: Text(
                            sizes[index],
                            style: TextStyle(fontSize: 2.sw),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
