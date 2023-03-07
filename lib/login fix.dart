import 'package:flutter/material.dart';
import 'package:bajulo/navbar.dart';
import 'package:bajulo/main.dart';

class loginfix extends StatelessWidget {
  const loginfix({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF404040),
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 30.0,
        backgroundColor: Color(0xFF1F1F1F),
        leading: IconButton(
          padding: EdgeInsets.only(left: screenWidth * 0.05),
          icon: Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => myApp()),
            );
          },
        ),
        title: Text("", style: TextStyle(fontFamily: "Poppins")),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.05),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Text(
                  'Welcome back to BajuLo!',
                  style: TextStyle(
                    fontSize: screenHeight * 0.035,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Text(
                  'Silahkan masukan data untuk login',
                  style: TextStyle(
                    fontSize: screenHeight * 0.018,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenHeight * 0.025,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Container(
                      width: screenWidth * 0.9,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(screenHeight * 0.05),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenHeight * 0.025,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Container(
                      width: screenWidth * 0.9,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(screenHeight * 0.05),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: ElevatedButton(
                  onPressed: () {
// Login button action
                  },
                  child: Container(
                    height: screenHeight * 0.06,
                    child: Center(
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: screenHeight * 0.025,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD7FC70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenHeight * 0.05),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
// Forgot password button action
                      },
                      child: Text(
                        'Lupa Password?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.018,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
// Sign up button action
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.018,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
