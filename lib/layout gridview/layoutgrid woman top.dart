import 'package:bajulo/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class gridLayoutWomanTop extends StatefulWidget {
  const gridLayoutWomanTop({super.key});

  @override
  State<gridLayoutWomanTop> createState() => _gridLayoutWomanTopState();
}

class _gridLayoutWomanTopState extends State<gridLayoutWomanTop> {
  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "Balloon Bolero Set Up",
      "price": "Rp. 756.000",
      "images":
          "https://cafe24img.poxo.com/romanticc/web/product/medium/202302/f8ce576c8e907faaeaab0948ea2fbc87.jpg",
    },
    {
      "title": "Side Button Wide Navy Vest ",
      "price": "Rp. 690.000",
      "images":
          "https://cafe24img.poxo.com/romanticc/web/product/medium/202208/b0777c58ac41ebb8fd877938c30bb30d.jpg",
    },
    {
      "title": "Wave Stitch Sweat Shirt",
      "price": "Rp. 702.000",
      "images":
          "https://cafe24img.poxo.com/romanticc/web/product/medium/202302/fa12124dedaedc47a791d863d630fcbb.jpg",
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
