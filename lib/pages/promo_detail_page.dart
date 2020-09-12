import 'package:bazoga/models/promo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PromoDetailPage extends StatefulWidget {
  Promo promo;

  PromoDetailPage(Promo promo) {
    this.promo = promo;
  }

  @override
  _PromoDetailPageState createState() => _PromoDetailPageState(promo);
}

class _PromoDetailPageState extends State<PromoDetailPage> {
  Promo promo;

  _PromoDetailPageState(Promo promo) {
    this.promo = promo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.network(
                  "http://www.kota103.my.id/assets/img/siamang1.jpg",
                  fit: BoxFit.fill,
                ),
                Text(promo.nama_promo),
                Text(DateFormat("dd-MM-yyyy")
                    .format(DateTime.parse(promo.periode_mulai.toString()))
                    .toString()),
                Text(DateFormat("dd-MM-yyyy")
                    .format(DateTime.parse(promo.periode_berakhir.toString()))
                    .toString()),
                Text(promo.deskripsi),
              ],
            )
          ],
        ),
      ),
    );
  }
}
