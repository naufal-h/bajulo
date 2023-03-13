import 'package:flutter/material.dart';
import 'main.dart';
import 'package:bajulo/product_img.dart';

class productDetails extends StatefulWidget {
  @override
  _productDetailsState createState() => _productDetailsState();
}

class _productDetailsState extends State<productDetails> {
  int selectedColorIndex = 0, selectedSizeIndex = 0;
  List<String> colorOptions = ['Black', 'Grey', 'Cream'],
      sizeOptions = ['S', 'M', 'L', 'XL'];
  List<List<String>> imagePaths = [
    [
      'assets/images/details_a1.png',
      'assets/images/details_a2.png',
      'assets/images/details_a3.png',
      'assets/images/details_a4.png',
    ],
    [
      'assets/images/details_b1.png',
      'assets/images/details_b2.png',
      'assets/images/details_b3.png',
      'assets/images/details_b4.png',
    ],
    [
      'assets/images/details_c1.png',
      'assets/images/details_c2.png',
      'assets/images/details_c3.png',
      'assets/images/details_c4.png',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produk", style: TextStyle(fontFamily: "Poppins")),
        centerTitle: true,
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 20),
            icon: Icon(Icons.favorite),
            onPressed: () {
              // pindah ke cart
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            border: Border(
              top: BorderSide(color: Colors.grey, width: 1),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 64,
                  margin: EdgeInsets.only(right: 14),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(
                          color: Theme.of(context).primaryColor, width: 1),
                      backgroundColor: Theme.of(context).colorScheme.background,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 64,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Add To Cart',
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          )),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      productImg(imageUrl: imagePaths[selectedColorIndex][0]),
                ),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 500,
              color: Colors.white,
              child: PageView(
                children: List.generate(
                  imagePaths[selectedColorIndex].length,
                  (index) => Image.asset(
                    imagePaths[selectedColorIndex][index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          "MAHAGRID MGD OVAL LOGO HOODIE",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'poppins',
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 14),
                  child: Text(
                    'Rp. 600.000',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'poppins',
                        color: Theme.of(context).colorScheme.error),
                  ),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum venenatis, mi sed cursus sagittis, elit purus hendrerit justo, vitae gravida ipsum tellus eu leo.',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.7), height: 150 / 100),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 16),
            margin: EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Size',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'poppins',
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: sizeOptions
                      .asMap()
                      .entries
                      .map(
                        (entry) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSizeIndex = entry.key;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: selectedSizeIndex == entry.key
                                  ? Theme.of(context).primaryColor
                                  : Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                sizeOptions[entry.key],
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 16),
            margin: EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Color',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'poppins',
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: colorOptions
                      .asMap()
                      .entries
                      .map(
                        (entry) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColorIndex = entry.key;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: selectedColorIndex == entry.key
                                  ? Theme.of(context).primaryColor
                                  : Colors.white,
                            ),
                            child: Center(
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.5),
                                  color: entry.key == 0
                                      ? Colors.black
                                      : entry.key == 1
                                          ? Colors.amber[100]
                                          : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExpansionTile(
                  childrenPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                  tilePadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  title: Text(
                    'Reviews',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'poppins',
                    ),
                  ),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  iconColor: Colors.white,
                  collapsedIconColor: Colors.white,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 52, top: 12, bottom: 6),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'See More Reviews',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          elevation: 0,
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
