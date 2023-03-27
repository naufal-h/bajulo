import 'package:bajulo/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class gridLayoutTrending extends StatefulWidget {
  const gridLayoutTrending({super.key});

  @override
  State<gridLayoutTrending> createState() => _gridLayoutTrendingState();
}

class _gridLayoutTrendingState extends State<gridLayoutTrending> {
  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "Wide Cotton Pants",
      "price": "Rp. 730.000",
      "images":
          "https://cafe24img.poxo.com/romanticc/web/product/medium/202302/85693e04a8cd5570458085e75d1ee380.jpg",
    },
    {
      "title": "Balloon Bolero Set Up",
      "price": "Rp. 756.000",
      "images":
          "https://cafe24img.poxo.com/romanticc/web/product/medium/202302/f8ce576c8e907faaeaab0948ea2fbc87.jpg",
    },
    {
      "title": "Mixed Knit Cardigan",
      "price": "Rp. 882.000",
      "images":
          "https://cafe24img.poxo.com/romanticc/web/product/medium/202302/58915ca78bc6878373cda4527ca72f16.jpg",
    },
    {
      "title": "Side Button Wide Navy Vest ",
      "price": "Rp. 690.000",
      "images":
          "https://cafe24img.poxo.com/romanticc/web/product/medium/202208/b0777c58ac41ebb8fd877938c30bb30d.jpg",
    },
    {
      "title": "Woozy Lettering Long Sleeve",
      "price": "Rp. 504.000",
      "images":
          "https://cafe24img.poxo.com/romanticc/web/product/medium/202301/cdc5742f1819c5c5b83d48ba3f9d5d90.jpg",
    },
    {
      "title": "Checker Board Knit Top",
      "price": "Rp. 648.000",
      "images":
          "https://cafe24img.poxo.com/romanticc/web/product/medium/202302/a6bf0f76ff890ec06b114c52383b7ba3.jpg",
    },
    {
      "title": "Cozy Flower Knit Cardigan",
      "price": "Rp. 1.026.000",
      "images":
          "https://cafe24img.poxo.com/romanticc/web/product/medium/202301/a81d859163f323f70b88a33c9c82466b.jpg",
    },
    {
      "title": "Wave Stitch Sweat Shirt",
      "price": "Rp. 702.000",
      "images":
          "https://cafe24img.poxo.com/romanticc/web/product/medium/202302/fa12124dedaedc47a791d863d630fcbb.jpg",
    },
    {
      "title": "Balloon Cotton Pants",
      "price": "Rp. 828.000",
      "images":
          "https://cafe24img.poxo.com/romanticc/web/product/medium/202301/c797d46908d7106692b2324858e56bcb.jpg",
    },
    {
      "title": "Wide Black Denim Jacket",
      "price": "Rp. 1.280.000",
      "images":
          "https://cafe24img.poxo.com/romanticc/web/product/medium/202208/3e61105d8bad665dadca1faea51f1130.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          mainAxisExtent: 310,
        ),
        itemCount: gridMap.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => productDetails()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  16.0,
                ),
                color: Colors.grey.shade700,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    child: Stack(
                      children: [
                        Image.network(
                          "${gridMap.elementAt(index)['images']}",
                          height: 170,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Image.asset(
                            "assets/icons/heart.png",
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${gridMap.elementAt(index)['title']}",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              color: Colors.white,
                            ))),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text("${gridMap.elementAt(index)['price']}",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))),
                        const SizedBox(
                          height: 8.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
