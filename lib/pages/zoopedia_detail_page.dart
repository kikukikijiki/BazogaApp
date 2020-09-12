import 'package:bazoga/models/hewan.dart';
import 'package:flutter/material.dart';

class ZoopediaDetailPage extends StatefulWidget {
  Hewan hewan_detail;

  ZoopediaDetailPage(Hewan detail) {
    hewan_detail = detail;
  }

  @override
  _ZoopediaDetailPageState createState() =>
      _ZoopediaDetailPageState(hewan_detail);
}

class _ZoopediaDetailPageState extends State<ZoopediaDetailPage> {
  Hewan hewan_detail;

  _ZoopediaDetailPageState(Hewan detail) {
    hewan_detail = detail;
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   extendBodyBehindAppBar: true,
    //   // backgroundColor: Colors.transparent,
    //   appBar: AppBar(
    //     title: Text(hewan_detail.nama_hewan),
    //     backgroundColor: Colors.transparent,
    //     elevation: 0,
    //   ),
    //   body: Hero(
    //       tag: hewan_detail,
    //       child: Material(
    //         type: MaterialType.transparency,
    //         child: Column(
    //           children: [
    //             Image.network(
    //               "http://www.kota103.my.id/assets/img/siamang1.jpg",
    //               width: double.infinity,
    //               height: 300,
    //               fit: BoxFit.fill,
    //             ),
    //             Text(hewan_detail.nama_ilmiah)
    //           ],
    //         ),
    //       )),
    // );
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // backgroundColor: Colors.white,
            centerTitle: true,
            pinned: true,
            toolbarHeight: 100,
            expandedHeight: 300.0,
            // title: Text(hewan_detail.nama_hewan),
            actions: [],
            flexibleSpace: Stack(
              children: <Widget>[
                Positioned.fill(
                    child: Image.network(
                  "http://www.kota103.my.id/assets/img/siamang1.jpg",
                  fit: BoxFit.cover,
                ))
              ],
            ),
          ),
          SliverList(
            // itemExtent: 100.0,
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Material(
                type: MaterialType.transparency,
                child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DetailHewan(
                            title: "Kingdom", value: hewan_detail.kingdom),
                        DetailHewan(title: "Filum", value: hewan_detail.filum),
                        DetailHewan(title: "Kelas", value: hewan_detail.kelas),
                        DetailHewan(title: "Ordo", value: hewan_detail.ordo),
                        DetailHewan(
                            title: "Famili", value: hewan_detail.famili),
                        DetailHewan(title: "Genus", value: hewan_detail.genus),
                        DetailHewan(
                            title: "Spesies", value: hewan_detail.spesies),
                        DetailHewan(
                            title: "Peta Penyebaran",
                            value: hewan_detail.peta_penyebaran),
                        DetailHewan(
                            title: "Makanan", value: hewan_detail.makanan),
                        DetailHewan(
                            title: "Habitat", value: hewan_detail.habitat),
                        DetailHewan(
                            title: "Tren Populasi",
                            value: hewan_detail.tren_populasi),
                        DetailHewan(
                            title: "Status Konservasi",
                            value: hewan_detail.status_konservasi),
                        DetailHewan(
                            title: "Ancaman", value: hewan_detail.ancaman),
                        DetailHewan(
                            title: "Fakta Menarik",
                            value: hewan_detail.fun_facts),
                      ],
                    )),
              );
            }, childCount: 1),
          ),
        ],
      ),
    );
  }
}

class DetailHewan extends StatelessWidget {
  const DetailHewan({
    Key key,
    @required this.title,
    @required this.value,
  }) : super(key: key);

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            Text(
              value,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ));
  }
}
