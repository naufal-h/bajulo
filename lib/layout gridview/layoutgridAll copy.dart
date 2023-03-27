import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class gridLayout extends StatefulWidget {
  const gridLayout({super.key});

  @override
  State<gridLayout> createState() => _gridLayoutState();
}

class _gridLayoutState extends State<gridLayout> {
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
      "title": "Wave Stitch Sweat Shirt",
      "price": "Rp. 702.000",
      "images":
          "https://cafe24img.poxo.com/romanticc/web/product/medium/202302/fa12124dedaedc47a791d863d630fcbb.jpg",
    },
    {
      "title": "Mixed Knit Cardigan",
      "price": "Rp. 882.000",
      "images":
          "https://cafe24img.poxo.com/romanticc/web/product/medium/202302/58915ca78bc6878373cda4527ca72f16.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
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
          return Container(
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
                  child: Image.network(
                    "${gridMap.elementAt(index)['images']}",
                    height: 170,
                    width: double.infinity,
                    fit: BoxFit.cover,
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
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.card_travel),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
