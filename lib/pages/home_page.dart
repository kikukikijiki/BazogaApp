import 'package:bazoga/pages/promo_page.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const double _appBarBottomBtnPosition = 24.0;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          toolbarHeight: 70,
          expandedHeight: 200.0,
          title: Text('Kebun Binatang Bandung'),
          actions: [
            IconButton(
              icon: const Icon(MdiIcons.sale),
              tooltip: 'Promo',
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      PromoPage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    var begin = Offset(0.0, 1.0);
                    var end = Offset.zero;
                    var curve = Curves.ease;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));

                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                ));
              },
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30.0),
            child: Transform.translate(
              offset: const Offset(0, _appBarBottomBtnPosition),
              child: RaisedButton(
                // shape: StadiumBorder(),
                child: Text("Status Kebun Binatang"),
                onPressed: () {},
              ),
            ),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.blue[100 * (index % 9)],
                child: Text('List Item $index'),
              );
            },
          ),
        ),
      ],
    );

    // return Container(
    //   color: Colors.tealAccent,
    //   child: Center(
    //       child: Text(
    //     "Homepage Screen",
    //     textAlign: TextAlign.center,
    //   )),
    // );
  }
}
