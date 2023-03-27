import 'package:bajulo/layout%20gridview/layoutNewArrival.dart';
import 'package:bajulo/layout%20gridview/layoutgrid%20men%20top.dart';
import 'package:bajulo/layout%20gridview/layoutgrid%20woman%20top.dart';
import 'package:bajulo/layout%20gridview/layoutgridAll.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class searchResult extends StatefulWidget {
  @override
  _searchResultState createState() => _searchResultState();
}

class _searchResultState extends State<searchResult>
    with TickerProviderStateMixin {
  late TabController tabController;
  TextEditingController searchInputController = TextEditingController();

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/filter.svg',
              color: Colors.white,
            ),
          ),
        ],
        title: Container(
          height: 40,
          child: TextField(
            style: TextStyle(fontSize: 14, color: Colors.white),
            decoration: InputDecoration(
              fillColor: Colors.white.withOpacity(0.1),
              filled: true,
              hintStyle:
                  TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.3)),
              hintText: 'Search...',
              prefixIcon:
                  Icon(Icons.search, color: Colors.white.withOpacity(0.3)),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 1),
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).primaryColor, width: 1),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            color: Colors.grey,
            child: TabBar(
              controller: tabController,
              indicatorColor: Theme.of(context).primaryColor,
              indicatorWeight: 5,
              unselectedLabelColor: Colors.white.withOpacity(0.5),
              labelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'poppins',
                  fontSize: 12),
              unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'poppins',
                  fontSize: 12),
              tabs: [
                Tab(
                  text: 'Related',
                ),
                Tab(
                  text: 'Newest',
                ),
                Tab(
                  text: 'Popular',
                ),
                Tab(
                  text: 'Best Seller',
                ),
              ],
            ),
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16, top: 16),
                child: Text(
                  'Search result of baju bagus buat lebaran',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Container(child: gridLayout()),
              ),
            ],
          ),
          ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16, top: 16),
                child: Text(
                  'Search result of baju bagus buat lebaran',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Container(child: gridLayoutWomanTop()),
              ),
            ],
          ),
          ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16, top: 16),
                child: Text(
                  'Search result of baju bagus buat lebaran',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Container(child: gridLayoutNewArrival()),
              ),
            ],
          ),
          ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16, top: 16),
                child: Text(
                  'Search result of baju bagus buat lebaran',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Container(child: gridLayoutMenTop()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
