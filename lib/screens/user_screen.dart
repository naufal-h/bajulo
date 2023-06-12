import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../app_routes.dart';
import 'package:provider/provider.dart';
import '../controllers/auth_controller.dart';
import 'package:bajulo/components/app_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:bajulo/components/cart/cart_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bajulo/components/user_tile.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    AuthController authController = Provider.of(context);
    var imageUrl = "";
    return Scaffold(
      drawer: AppDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(title: const Center(child: Text("")), actions: [
        const CartButton(),
      ]),
      body: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.background,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ),

                  Stack(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                            image: NetworkImage(FirebaseAuth
                                    .instance.currentUser?.photoURL ??
                                'https://www.pngitem.com/pimgs/m/30-307416_profile-icon-png-image-free-download-searchpng-employee.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color.fromRGBO(188, 206, 236, 1),
                          ),
                          child: IconButton(
                            onPressed: () async {
                              // /Step 1:Pick image/
                              //Install image_picker
                              //Import the corresponding library

                              ImagePicker imagePicker = ImagePicker();
                              XFile? file = await imagePicker.pickImage(
                                  source: ImageSource.gallery);
                              print('${file?.path}');

                              if (file == null) return;
                              //Import dart:core
                              String uniqueFileName = DateTime.now()
                                  .millisecondsSinceEpoch
                                  .toString();

                              // /Step 2: Upload to Firebase storage/
                              //Install firebase_storage
                              //Import the library

                              //Get a reference to storage root
                              Reference referenceRoot =
                                  FirebaseStorage.instance.ref();
                              Reference referenceDirImages =
                                  referenceRoot.child('images');

                              //Create a reference for the image to be stored
                              Reference referenceImageToUpload =
                                  referenceDirImages.child(uniqueFileName);

                              //Handle errors/success
                              try {
                                //Store the file
                                await referenceImageToUpload
                                    .putFile(File(file.path));
                                //Success: get the download URL
                                imageUrl = await referenceImageToUpload
                                    .getDownloadURL();
                                await FirebaseAuth.instance.currentUser!
                                    .updatePhotoURL(imageUrl);
                              } catch (error) {
                                //Some error occurred
                              }
                              setState(() {});
                            },
                            icon: Icon(
                              LineAwesomeIcons.camera,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),

                  // Container(
                  //   width: 96,
                  //   height: 96,
                  //   margin: EdgeInsets.only(bottom: 15),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(100),
                  //     color: Colors.grey,
                  //     image: DecorationImage(
                  //       image: AssetImage('assets/images/pfp.jpg'),
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),

                  Container(
                    // margin: EdgeInsets.only(bottom: 15),
                    child: Text(
                      authController.authData.email!.split('@')[0],
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: Text(
                      'ACCOUNT',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          letterSpacing: 6 / 100,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: userTile(
                      onTap: () {},
                      margin: EdgeInsets.only(top: 10),
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                      title: 'Wishlist',
                      subtitle: 'Track Favorites, Get Notified.',
                    ),
                  ),
                  userTile(
                    margin: EdgeInsets.only(top: 0),
                    onTap: () {},
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.white,
                    ),
                    title: 'Last Seen',
                    subtitle: 'Easily pick up where you left off.',
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context)
                        .pushReplacementNamed(AppRoutes.orders),
                    child: userTile(
                      margin: EdgeInsets.only(top: 0),
                      onTap: () {},
                      icon: Icon(
                        Icons.description,
                        color: Colors.white,
                      ),
                      title: 'Orders',
                      subtitle: 'Stay on top of your purchases.',
                    ),
                  ),
                  userTile(
                    margin: EdgeInsets.only(top: 0),
                    onTap: () {},
                    icon: Icon(
                      Icons.edit_location_alt_rounded,
                      color: Colors.white,
                    ),
                    title: 'Addresses',
                    subtitle: 'Manage your shipping and billing addresses.',
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: Text(
                      'SETTINGS',
                      style: TextStyle(
                          letterSpacing: 6 / 100,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: userTile(
                      onTap: () {},
                      margin: EdgeInsets.only(top: 10),
                      icon: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      title: 'Settings',
                      subtitle:
                          'Customize your account preferences and options.',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Provider.of<AuthController>(context, listen: false)
                          .logout();
                      Navigator.restorablePushNamedAndRemoveUntil(
                        context,
                        AppRoutes.landing,
                        (route) => false,
                      );
                    },
                    child: userTile(
                      margin: EdgeInsets.only(top: 0),
                      onTap: () {},
                      icon: Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      iconBackground: Colors.red.withOpacity(0.1),
                      title: 'Log Out',
                      titleColor: Colors.red,
                      subtitle: 'Safely sign out of your account.',
                    ),
                  ),
                ],
              ),
            )
          ]),
    );
  }
}
