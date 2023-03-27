import 'package:bajulo/login%20fix.dart';
import 'package:flutter/material.dart';
import 'widget028Bottom.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class otp extends StatefulWidget {
  @override
  _otpState createState() => _otpState();
}

class _otpState extends State<otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Verification", style: TextStyle(fontFamily: "Poppins")),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 24),
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 8),
            child: Text(
              'Email verification',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontFamily: 'poppins',
                fontSize: 20,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 32),
            child: Row(
              children: [
                Text(
                  'OTP Code sent to ',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.7), fontSize: 14),
                ),
                SizedBox(width: 8),
                Text(
                  'email@email.com',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          PinCodeTextField(
            appContext: (context),
            length: 4,
            onChanged: (value) {},
            obscureText: false,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderWidth: 1.5,
              borderRadius: BorderRadius.circular(8),
              fieldHeight: 70,
              fieldWidth: 70,
              activeColor: Theme.of(context).primaryColor,
              inactiveColor: Colors.grey,
              inactiveFillColor:
                  Theme.of(context).primaryColor.withOpacity(0.1),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 32, bottom: 16),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => loginfix()));
              },
              child: Text(
                'Verify',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    fontFamily: 'poppins'),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 36, vertical: 18),
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 0,
                shadowColor: Colors.transparent,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Resend OTP Code',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: ElevatedButton.styleFrom(
              foregroundColor: Theme.of(context).primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 36, vertical: 18),
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 0,
              shadowColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
