import 'package:bazoga/controllers/network_helper.dart';
import 'package:bazoga/models/promo.dart';
import 'package:bazoga/pages/promo_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PromoPage extends StatefulWidget {
  @override
  _PromoPageState createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Promo")),
        body: Container(
          child: Center(
            child: _promosData(),
          ),
        ));
  }
}

FutureBuilder _promosData() {
  return FutureBuilder<List<Promo>>(
    future: GetPromos().getPromos(),
    builder: (BuildContext context, AsyncSnapshot<List<Promo>> snapshot) {
      if (snapshot.hasData) {
        List<Promo> data = snapshot.data;
        return _promos(data, context);
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return CircularProgressIndicator();
    },
  );
}

StaggeredGridView _promos(data, context) {
  return StaggeredGridView.countBuilder(
    crossAxisCount: 4,
    itemCount: data.length,
    itemBuilder: (BuildContext context, int index) => InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PromoDetailPage(data[index])));
        },
        child: _tile(
          data[index],
        )),
    staggeredTileBuilder: (int index) => new StaggeredTile.count(4, 2),
  );
  // return GridView.builder(
  //     gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 2,
  //         childAspectRatio: (MediaQuery.of(context).size.width / 4) /
  //             (MediaQuery.of(context).size.height / 7)),
  //     itemCount: data.length,
  //     itemBuilder: (context, index) {
  //       return Card(child: _tile(data[index]));
  //     });
}

Container _tile(Promo promo) {
  return Container(
    child: Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          LimitedBox(
              maxHeight: 130,
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Image.network(
                  "http://www.kota103.my.id/assets/img/" + promo.gambar,
                  fit: BoxFit.fitWidth,
                ),
              )),
          Flexible(
              child: Padding(
            padding: EdgeInsets.all(0),
            child: Text(
              promo.nama_promo,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ))
        ],
      ),
    ),
  );
}
