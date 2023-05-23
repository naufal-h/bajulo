import 'package:flutter/material.dart';
import 'package:bajulo_new/components/app_drawer.dart';

class SearchScreen extends StatelessWidget {
  List<Map<String, dynamic>> riwayat = [
    {
      "Produk": "RMTCRW Label Sweat Shirt",
    },
    {
      "Produk": "Ripndip x High Times Hoodie",
    },
    {
      "Produk": "BadBear Sweatshirt",
    },
  ];
  List<Map<String, dynamic>> popular = [
    {
      "Gambar": "assets/images/produk1.png",
      "Produk": "acne studios",
    },
    {
      "Gambar": "assets/images/produk2.png",
      "Produk": "grooverhyme",
    },
    {
      "Gambar": "assets/images/produk3.png",
      "Produk": "vivastudio",
    },
    {
      "Gambar": "assets/images/produk4.png",
      "Produk": "Ader Error",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Container(
          height: 40,
          child: Form(
            child: TextFormField(
              style: TextStyle(fontSize: 14, color: Colors.white),
              decoration: InputDecoration(
                fillColor: Colors.white.withOpacity(0.1),
                filled: true,
                hintStyle: TextStyle(
                    fontSize: 14, color: Colors.white.withOpacity(0.3)),
                hintText: 'Search...',
                prefixIcon:
                    Icon(Icons.search, color: Colors.white.withOpacity(0.3)),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 1),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onFieldSubmitted: (value) {},
            ),
          ),
        ),
      ),
      body: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: riwayat.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          border: Border(
                            top: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                            bottom: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Text(
                          "${riwayat[index]["Produk"]}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Delete search history',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Popular Search :',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      children: List.generate(popular.length, (index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            color: Theme.of(context).colorScheme.background,
                            width: MediaQuery.of(context).size.width / 2,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              children: [
                                Container(
                                  width: 46,
                                  height: 46,
                                  margin: EdgeInsets.only(right: 16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "${popular[index]["Gambar"]}",
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "${popular[index]["Produk"]}",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                )
              ],
            ),
          ]),
    );
  }
}
