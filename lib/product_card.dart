import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class product_card extends StatelessWidget {
  final productlist=[
    {
      'name': 'Judul',
      'image': 'assets/images/asset 2.png',
      'price':'10.000',
    },
    {
      'name': 'Judul',
      'image': 'assets/images/asset 2.png',
      'price':'10.000',
    },
    {
      'name': 'Judul',
      'image': 'assets/images/asset 2.png',
      'price':'10.000',
    },
    {
      'name': 'Judul',
      'image': 'assets/images/asset 2.png',
      'price':'10.000',
    },
    
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productlist.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index){
        return recent(recent_prod_image: productlist[index]['image'],recent_prod_name: productlist[index]['name'],recent_prod_price: productlist[index]['price'],);
      },
    );
  }
}

class recent extends StatelessWidget {
  final recent_prod_name;
  final recent_prod_image;
  final recent_prod_price;

  recent({
    this.recent_prod_name,
    this.recent_prod_image,
    this.recent_prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            height: 200,
            width: 160,
            decoration: BoxDecoration(
              color: Colors.grey.shade700
            ),
            child: Image.asset("assets/images/asset 2.png"),
            
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: ListTile(
            title: Text(recent_prod_name ,style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white))) ,
            subtitle: Text(recent_prod_price,style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white))),
          ),
        )
      ],
    );
  }
}