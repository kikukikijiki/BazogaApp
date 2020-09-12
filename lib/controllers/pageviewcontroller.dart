import 'package:bazoga/pages/event_page.dart';
import 'package:bazoga/pages/home_page.dart';
import 'package:bazoga/pages/maps_page.dart';
import 'package:bazoga/pages/zoopedia_page.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class PageViewController extends StatefulWidget {
  @override
  _PageViewControllerState createState() => _PageViewControllerState();
}

class _PageViewControllerState extends State<PageViewController> {
  static final pageController = PageController(
    initialPage: 0,
  );

  int _indexNavigation = 0;
  int _indexPage = 0;
  String _outputController = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // title: Text("Bazooga"),
      // ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (int val) {
          setState(() {
            switch (val) {
              case 0:
                {
                  _indexPage = 0;
                  _indexNavigation = 0;
                  pageController.jumpToPage(_indexPage);
                  break;
                }
              case 1:
                {
                  _indexPage = 1;
                  _indexNavigation = 1;
                  pageController.jumpToPage(_indexPage);
                  break;
                }
              case 2:
                {
                  _indexPage = 2;
                  _indexNavigation = 3;
                  pageController.jumpToPage(_indexPage);
                  break;
                }
              case 3:
                {
                  _indexPage = 3;
                  _indexNavigation = 4;
                  pageController.jumpToPage(_indexPage);
                  break;
                }
            }
          });
        },
        controller: pageController,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          HomePage(),
          Zoopedia(),
          InteractiveMaps(),
          EventPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexNavigation,
        onTap: (int index) {
          setState(() {
            switch (index) {
              case 0:
                {
                  _indexPage = 0;
                  _indexNavigation = 0;
                  pageController.jumpToPage(_indexPage);
                  break;
                }
              case 1:
                {
                  _indexPage = 1;
                  _indexNavigation = 1;
                  pageController.jumpToPage(_indexPage);
                  break;
                }
              case 3:
                {
                  _indexPage = 2;
                  _indexNavigation = 3;
                  pageController.jumpToPage(_indexPage);
                  break;
                }
              case 4:
                {
                  _indexPage = 3;
                  _indexNavigation = 4;
                  pageController.jumpToPage(_indexPage);
                  break;
                }
            }
          });
          ;
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Beranda'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections),
            title: Text('Zoopedia'),
          ),
          BottomNavigationBarItem(
            icon: Icon(null),
            title: Text('Scan'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Denah'),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.calendar),
            title: Text('Event'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(MdiIcons.qrcodeScan), onPressed: _scan),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Future _scan() async {
    String barcode = await scanner.scan();
    this._outputController = barcode;
  }
}
