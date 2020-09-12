import 'package:flutter/material.dart';

class Event {
  final String id_event;
  final String nama_event;
  final DateTime periode_mulai;
  final DateTime periode_berakhir;
  final TimeOfDay waktu_mulai;
  final TimeOfDay waktu_berakhir;
  final String deskripsi;
  final String gambar;

  Event(
      {this.id_event,
      this.nama_event,
      this.periode_mulai,
      this.periode_berakhir,
      this.waktu_mulai,
      this.waktu_berakhir,
      this.deskripsi,
      this.gambar});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id_event: json['id_event'],
      nama_event: json['nama_event'],
      periode_mulai: DateTime.parse(json['periode_mulai']),
      periode_berakhir: DateTime.parse(json['periode_berakhir']),
      waktu_mulai: TimeOfDay(
          hour: int.parse(json['waktu_mulai'].split(":")[0]),
          minute: int.parse(json['waktu_mulai'].split(":")[1])),
      waktu_berakhir: TimeOfDay(
          hour: int.parse(json['waktu_berakhir'].split(":")[0]),
          minute: int.parse(json['waktu_berakhir'].split(":")[1])),
      deskripsi: json['deskripsi_event'],
      gambar: json['gambar_event'],
    );
  }
}
