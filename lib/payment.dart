import 'package:bajulo/orderConfirm.dart';
import 'package:flutter/material.dart';

class paymentMethod extends StatefulWidget {
  const paymentMethod({Key? key}) : super(key: key);

  @override
  State<paymentMethod> createState() => _paymentMethodState();
}

class _paymentMethodState extends State<paymentMethod> {
  int _type = 1;
  void _handleRadio(Object? e) => setState(() {
        _type = e as int;
      });

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Payment Method", style: TextStyle(fontFamily: "Poppins")),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey, width: 1))),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => orderConfirm()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 6,
                child: Text(
                  'Checkout',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      fontFamily: 'poppins'),
                ),
              ),
              Container(
                width: 2,
                height: 26,
                color: Colors.black.withOpacity(0.5),
              ),
              Flexible(
                flex: 6,
                child: Text(
                  'Rp. 1.234,000',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: 'poppins'),
                ),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 36, vertical: 18),
            backgroundColor: Theme.of(context).primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 0,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 40.0),
                Container(
                  width: size.width,
                  height: 55.0,
                  decoration: BoxDecoration(
                    border: _type == 1
                        ? Border.all(
                            width: 1.0, color: Theme.of(context).primaryColor)
                        : Border.all(width: 0.3, color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Colors.grey,
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Radio(
                                  value: 1,
                                  groupValue: _type,
                                  onChanged: _handleRadio,
                                  activeColor: Theme.of(context).primaryColor),
                              Text('QRIS',
                                  style: _type == 1
                                      ? TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white)
                                      : TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white)),
                            ],
                          ),
                          Image.asset("assets/images/qris.png", width: 50.0),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                Container(
                  width: size.width,
                  height: 55.0,
                  decoration: BoxDecoration(
                    border: _type == 2
                        ? Border.all(
                            width: 1.0, color: Theme.of(context).primaryColor)
                        : Border.all(width: 0.3, color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Colors.grey,
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Radio(
                                  value: 2,
                                  groupValue: _type,
                                  onChanged: _handleRadio,
                                  activeColor: Theme.of(context).primaryColor),
                              Text('Credit card',
                                  style: _type == 2
                                      ? TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white)
                                      : TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white)),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset("assets/images/visa.png",
                                  width: 30.0),
                              const SizedBox(width: 8.0),
                              Image.asset("assets/images/mastercard.png",
                                  width: 30.0),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                Container(
                  width: size.width,
                  height: 55.0,
                  decoration: BoxDecoration(
                    border: _type == 3
                        ? Border.all(
                            width: 1.0, color: Theme.of(context).primaryColor)
                        : Border.all(width: 0.3, color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Colors.grey,
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Radio(
                                  value: 3,
                                  groupValue: _type,
                                  onChanged: _handleRadio,
                                  activeColor: Theme.of(context).primaryColor),
                              Text('Paypal',
                                  style: _type == 3
                                      ? TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white)
                                      : TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white)),
                            ],
                          ),
                          Image.asset("assets/images/paypal.png", width: 50.0),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Sub-total',
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor)),
                    Text('Rp. 1.234,000',
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                  ],
                ),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Shipping fee',
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor)),
                    Text('Rp. 0',
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                  ],
                ),
                const SizedBox(height: 15.0),
                Container(width: size.width, height: 1.0, color: Colors.grey),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Payment',
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColor)),
                    Text('Rp. 1.234,000',
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
