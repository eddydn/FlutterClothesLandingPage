import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MainImage extends StatelessWidget {
  final List<String> images;
  final CarouselController controller;

  const MainImage({super.key, required this.images, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: const Color(0xff76321D),
          width: double.infinity,
          child: CarouselSlider(
              items: images.map((image) {
                return Card(
                  child: CachedNetworkImage(
                    imageUrl: image,
                    placeholder: (context, url) =>
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error),
                  ),
                );
              }).toList(),
            carouselController: controller,
            options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              viewportFraction: 0.4,
              aspectRatio: 1.5
            ),
          ),
        )
      ],
    );
  }
}
