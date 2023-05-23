import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:bajulo_new/components/cart/cart_button.dart';
import 'package:intl/intl.dart';
import 'package:bajulo_new/components/app_drawer.dart';

class NotifScreen extends StatefulWidget {
  const NotifScreen({super.key});

  @override
  State<NotifScreen> createState() => _NotifScreenState();
}

class _NotifScreenState extends State<NotifScreen> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(title: const Center(child: Text("")), actions: [
        const CartButton(),
      ]),
      body: ListView(
        children: [
          NotificationTile(
            img:
                'https://images.tokopedia.net/img/cache/500-square/hDjmkQ/2022/3/29/c5e311c3-f63f-4ecf-9b1e-f9857254329e.jpg',
            title: 'Pesananmu telah selesai',
            subtitle:
                'Klik untuk beri nilai pesanan 230120SMUVK98Y & dapatkan 25 Koin',
            time: DateTime.now(),
            isExpanded: false,
          ),
          NotificationTile(
            img:
                'https://images.tokopedia.net/img/cache/500-square/hDjmkQ/2022/3/29/c5e311c3-f63f-4ecf-9b1e-f9857254329e.jpg',
            title: 'Pesananmu telah diterima',
            subtitle:
                'Paket SPXID035517089172 dari pesanan 230202064TAPHX telah diterima',
            time: DateTime.now(),
            isExpanded: false,
          ),
          NotificationTile(
            img:
                'https://images.tokopedia.net/img/cache/500-square/hDjmkQ/2022/3/29/c5e311c3-f63f-4ecf-9b1e-f9857254329e.jpg',
            title: 'Pesananmu telah selesai',
            subtitle:
                'Klik untuk beri nilai pesanan 230120SMUVK98Y & dapatkan 25 Koin',
            time: DateTime.now(),
            isExpanded: false,
          ),
          NotificationTile(
            img:
                'https://images.tokopedia.net/img/cache/500-square/hDjmkQ/2022/3/29/c5e311c3-f63f-4ecf-9b1e-f9857254329e.jpg',
            title: 'Pesananmu telah diterima',
            subtitle:
                'Paket SPXID035517089172 dari pesanan 230202064TAPHX telah diterima',
            time: DateTime.now(),
            isExpanded: false,
          ),
          NotificationTile(
            img:
                'https://images.tokopedia.net/img/cache/500-square/hDjmkQ/2022/3/29/c5e311c3-f63f-4ecf-9b1e-f9857254329e.jpg',
            title: 'Pesananmu telah selesai',
            subtitle:
                'Klik untuk beri nilai pesanan 230120SMUVK98Y & dapatkan 25 Koin',
            time: DateTime.now(),
            isExpanded: false,
          ),
          NotificationTile(
            img:
                'https://images.tokopedia.net/img/cache/500-square/hDjmkQ/2022/3/29/c5e311c3-f63f-4ecf-9b1e-f9857254329e.jpg',
            title: 'Pesananmu telah diterima',
            subtitle:
                'Paket SPXID035517089172 dari pesanan 230202064TAPHX telah diterima',
            time: DateTime.now(),
            isExpanded: false,
          ),
          NotificationTile(
            img:
                'https://images.tokopedia.net/img/cache/500-square/hDjmkQ/2022/3/29/c5e311c3-f63f-4ecf-9b1e-f9857254329e.jpg',
            title: 'Pesananmu telah selesai',
            subtitle:
                'Klik untuk beri nilai pesanan 230120SMUVK98Y & dapatkan 25 Koin',
            time: DateTime.now(),
            isExpanded: false,
          ),
          NotificationTile(
            img:
                'https://images.tokopedia.net/img/cache/500-square/hDjmkQ/2022/3/29/c5e311c3-f63f-4ecf-9b1e-f9857254329e.jpg',
            title: 'Pesananmu telah diterima',
            subtitle:
                'Paket SPXID035517089172 dari pesanan 230202064TAPHX telah diterima',
            time: DateTime.now(),
            isExpanded: false,
          ),
        ],
      ),
    );
  }
}

class NotificationTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final DateTime time;
  final bool isExpanded;
  final String img;

  NotificationTile(
      {required this.title,
      required this.subtitle,
      required this.time,
      required this.isExpanded,
      required this.img});

  @override
  _NotificationTileState createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Image.network(widget.img),
          title: Text(
            widget.title,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontFamily: "Poppins"),
          ),
          trailing: IconButton(
            icon: Icon(
                _isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: Colors.white),
            onPressed: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
          ),
          isThreeLine: true,
          dense: true,
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.subtitle,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w300),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(DateFormat.yMd().add_jm().format(widget.time),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w300)),
              SizedBox(height: 8),
            ],
          ),
        ),
        _isExpanded
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Detail notifikasi',
                  style: TextStyle(color: Colors.white, fontFamily: "Poppins"),
                ),
              )
            : SizedBox(),
        Divider(
          thickness: 1,
          color: Colors.white,
        ),
      ],
    );
  }
}
