import 'dart:async';
import 'dart:math';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_landing_page_01/state_management/state_management.dart';
import 'package:flutter_landing_page_01/widgets/main_image.dart';
import 'package:flutter_landing_page_01/widgets/price.dart';
import 'package:flutter_landing_page_01/widgets/product_detail.dart';
import 'package:flutter_landing_page_01/widgets/rating.dart';
import 'package:flutter_landing_page_01/widgets/section_buy_now_widget.dart';
import 'package:flutter_landing_page_01/widgets/size_guide_widget.dart';
import 'package:flutter_landing_page_01/widgets/size_widget.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'const/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
        builder: (context) => MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const MyHomePage(title: 'Flutter Demo Home Page'),
            ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ExpansionTileController controller = ExpansionTileController();

  late Timer _timer;

  @override
  void initState() {
    super.initState();

    now.value = DateTime.now();
    final saleDateEnd = DateTime(now.value.year, now.value.month,
        now.value.day + 1, 0, 0); // Fake date end is next day from now
    auction.value = saleDateEnd;

    //Calculate timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      now.value = DateTime.now(); // Update
      if (auction.value.isBefore(now.value)) {
        _timer.cancel();
      }
    });

    randomSoldNumber();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.expand(); // Default expand Product Detail
    });
  }

  @override
  Widget build(BuildContext context) {
    final buttonCarouselController = CarouselController();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: Container(
          decoration: const BoxDecoration(color: Colors.black),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        size: 20,
                      ),
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert,
                        size: 20,
                      ),
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainImage(
                    images: Constant.images,
                    controller: buttonCarouselController),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: SizedBox(
                    height: 30.screenHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: Constant.images.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(left: 8.0),
                                child: GestureDetector(
                                  onTap: () => {
                                    buttonCarouselController.jumpToPage(index)
                                  },
                                  child: Image.network(
                                    Constant.images[index],
                                    width: 10.sw,
                                    height: 10.sw,
                                  ),
                                ),
                              );
                            })
                      ],
                    ),
                  ),
                ),
                const PriceWidget(
                  oldPrice: '\$499.9',
                  newPrice: '\$399.9',
                ),
                Obx(() => RatingWidget(
                      soldNumber: soldNumber.value,
                    )),
                ProductDetail(
                    title: 'Product Detail',
                    controller: controller,
                    text: Constant.detail),
                ProductDetail(
                    title: 'Finer Detail',
                    controller: ExpansionTileController(),
                    text: Constant.finerDetail),
                SizeWidget(sizes: Constant.sizes),
                SizeGuideWidget(
                  tableHeader: Constant.tableHeader,
                  sizeXXS: Constant.sizeXXS,
                  sizeXS: Constant.sizeXS,
                  sizeS: Constant.sizeS,
                  sizeM: Constant.sizeM,
                  sizeL: Constant.sizeL,
                  sizeXL: Constant.sizeXL,
                  sizeXXL: Constant.sizeXXL,
                ),
                SizedBox(
                  height: 10.sh,
                )
              ],
            ),
          ),
          Obx(() => SectionBuyNowWidget(time: now.value))
        ],
      ),
    );
  }

  void randomSoldNumber() {
    var rd = Random();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      soldNumber += (1 + rd.nextInt(3 - 1));
    });
  }
}
