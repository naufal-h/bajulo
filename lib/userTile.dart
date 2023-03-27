import 'package:flutter/material.dart';
import 'package:bajulo/const/tema.dart';
import 'package:bajulo/main.dart';

class userTile extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subtitle;
  final Function onTap;
  final EdgeInsetsGeometry margin;
  final Color iconBackground;
  final Color titleColor;

  userTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.margin,
    this.iconBackground = Colors.grey,
    this.titleColor = const Color(0xFF1F1F1F),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Container(
        margin: margin,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
        ),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: iconBackground,
                borderRadius: BorderRadius.circular(8),
              ),
              child: icon,
            ),
            Expanded(
              child: (subtitle == null)
                  ? Text('$title',
                      style: TextStyle(
                          color: titleColor,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w500))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('$title',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.w500)),
                        SizedBox(height: 2),
                        Text('$subtitle',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 12)),
                      ],
                    ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
