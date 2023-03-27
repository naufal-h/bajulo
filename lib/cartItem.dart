import 'package:flutter/material.dart';
import 'package:bajulo/model/cartModel.dart';
import 'package:intl/intl.dart';

class CartTile extends StatefulWidget {
  final Cart data;
  CartTile({required this.data});

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 12),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                  image: AssetImage(widget.data.image[0]), fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.data.name}',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'poppins',
                      color: Colors.black),
                ),
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Rp. ${NumberFormat('#,###').format(widget.data.price)}',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: 'poppins',
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        height: 26,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (widget.data.count > 1) {
                                    widget.data.count--;
                                    widget.data.price -= widget.data.itemCost;
                                  }
                                });
                              },
                              child: Container(
                                width: 26,
                                height: 26,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                ),
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  '${widget.data.count}',
                                  style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  widget.data.count++;
                                  widget.data.price += widget.data.itemCost;
                                });
                              },
                              child: Container(
                                width: 26,
                                height: 26,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                ),
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
