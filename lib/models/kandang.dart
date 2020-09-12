import 'dart:ffi';

class Kandang {
  final String id_kandang;
  final String nama_kandang;
  final String jenis_kandang;
  final Float longitude;
  final Float latitude;
  final int radius;

  Kandang(
      {this.id_kandang,
      this.nama_kandang,
      this.jenis_kandang,
      this.longitude,
      this.latitude,
      this.radius});

  factory Kandang.fromJson(Map<String, dynamic> json) {
    return Kandang(
      id_kandang: json['id_kandang'],
      nama_kandang: json['nama_kandang'],
      jenis_kandang: json['jenis_kandang'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      radius: json['radius'],
    );
  }
}
