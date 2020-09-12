import 'package:flutter/material.dart';

class Marketing {
  final String id_marketing;
  final int harga_tiket_masuk;
  final TimeOfDay jam_buka;
  final TimeOfDay jam_tutup;
  final DateTime tanggal_berlaku;

  Marketing(
      {this.id_marketing,
      this.harga_tiket_masuk,
      this.jam_buka,
      this.jam_tutup,
      this.tanggal_berlaku});

  factory Marketing.fromJson(Map<String, dynamic> json) {
    return Marketing(
      id_marketing: json['id_marketing'],
      harga_tiket_masuk: json['harga_tiket_masuk'],
      jam_buka: TimeOfDay(
          hour: int.parse(json['jam_buka'].split(":")[0]),
          minute: int.parse(json['jam_buka'].split(":")[1])),
      jam_tutup: TimeOfDay(
          hour: int.parse(json['jam_tutup'].split(":")[0]),
          minute: int.parse(json['jam_tutup'].split(":")[1])),
      tanggal_berlaku: DateTime.parse(json['tanggal_berlaku']),
    );
  }
}
