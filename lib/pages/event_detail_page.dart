import 'package:bazoga/models/event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventDetailPage extends StatefulWidget {
  Event event;

  EventDetailPage(Event event) {
    this.event = event;
  }

  @override
  _EventDetailPageState createState() => _EventDetailPageState(event);
}

class _EventDetailPageState extends State<EventDetailPage> {
  Event event;

  _EventDetailPageState(Event event) {
    this.event = event;
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
                Text(event.nama_event),
                Text(DateFormat("dd-MM-yyyy")
                    .format(DateTime.parse(event.periode_mulai.toString()))
                    .toString()),
                Text(DateFormat("dd-MM-yyyy")
                    .format(DateTime.parse(event.periode_berakhir.toString()))
                    .toString()),
                Text(event.waktu_mulai.hour.toString() +
                    ":" +
                    event.waktu_mulai.minute.toString().padLeft(2, '0')),
                Text(event.waktu_berakhir.hour.toString() +
                    ":" +
                    event.waktu_berakhir.minute.toString().padLeft(2, '0')),
                Text(event.deskripsi),
              ],
            )
          ],
        ),
      ),
    );
  }
}
