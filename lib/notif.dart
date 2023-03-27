import 'package:flutter_svg/flutter_svg.dart';
import 'package:bajulo/main.dart';
import 'package:bajulo/cart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bajulo/navbar.dart';

class notif extends StatefulWidget {
  const notif({super.key});

  @override
  State<notif> createState() => _notifState();
}

class _notifState extends State<notif> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Notifications", style: TextStyle(fontFamily: "Poppins")),
        centerTitle: true,
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 20),
            icon:
                SvgPicture.asset('assets/icons/cart.svg', color: Colors.white),
            onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const cart()))
            },
          ),
        ],
      ),
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
