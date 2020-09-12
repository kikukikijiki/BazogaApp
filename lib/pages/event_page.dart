import 'package:bazoga/pages/event_detail_page.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:bazoga/controllers/network_helper.dart';
import 'package:bazoga/models/event.dart';
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Event"),
        ),
        body: Container(
            child: Center(
          child: _eventsData(),
        )));
  }
}

FutureBuilder _eventsData() {
  return FutureBuilder<List<Event>>(
    future: GetEvents().getEvents(),
    builder: (BuildContext context, AsyncSnapshot<List<Event>> snapshot) {
      if (snapshot.hasData) {
        List<Event> data = snapshot.data;
        return _events(data, context);
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return CircularProgressIndicator();
    },
  );
}

StaggeredGridView _events(data, context) {
  // return GridView.builder(
  //     gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 1,
  //         childAspectRatio: (MediaQuery.of(context).size.width / 4) /
  //             (MediaQuery.of(context).size.height / 7)),
  //     itemCount: data.length,
  //     itemBuilder: (context, index) {
  //       return Card(child: _tile(data[index]));
  //     });
  return StaggeredGridView.countBuilder(
    crossAxisCount: 4,
    itemCount: data.length,
    itemBuilder: (BuildContext context, int index) => InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EventDetailPage(data[index])));
      },
      child: _tile(data[index]),
    ),
    staggeredTileBuilder: (int index) => new StaggeredTile.count(4, 3),
  );
}

Container _tile(Event event) {
  return Container(
    child: Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          LimitedBox(
              maxHeight: 200,
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Image.network(
                  "http://www.kota103.my.id/assets/img/siamang.jpg" /*+ event.gambar*/,
                  fit: BoxFit.fitWidth,
                ),
              )),
          Flexible(
              child: Padding(
            padding: EdgeInsets.all(0),
            child: Text(
              event.nama_event,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ))
        ],
      ),
    ),
  );
}
