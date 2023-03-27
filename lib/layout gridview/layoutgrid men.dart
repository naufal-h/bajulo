import 'package:bajulo/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class gridLayoutMen extends StatefulWidget {
  const gridLayoutMen({super.key});

  @override
  State<gridLayoutMen> createState() => _gridLayoutMenState();
}

class _gridLayoutMenState extends State<gridLayoutMen> {
  final List<Map<String, dynamic>> gridMap = [
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
      "title": "Balloon Cotton Pants",
      "price": "Rp. 828.000",
      "images":
          "https://cafe24img.poxo.com/romanticc/web/product/medium/202301/c797d46908d7106692b2324858e56bcb.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
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
