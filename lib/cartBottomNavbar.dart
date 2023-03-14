import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class cartBottomNavbar extends StatelessWidget {
  const cartBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        color: Colors.grey.shade700,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total: ",
                  style: TextStyle(color: Colors.white,fontFamily:"Poppins",fontWeight: FontWeight.bold,fontSize: 20),
                ),
                Text(
                  "20.000",style: TextStyle(color: Colors.white,fontFamily:"Poppins",fontWeight: FontWeight.bold,fontSize: 20)
                )
              ],
            ),
          
          Container(
            alignment: Alignment.center,
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 164, 193, 84),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Text("Check Out",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),

          )
          ],
        ),
      ),
    );
  }
}
