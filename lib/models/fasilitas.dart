import 'dart:ffi';

class Fasilitas {
  final String id_fasilitas;
  final String nama_fasilitas;
  final String jenis_fasilitas;
  final Float longitude;
  final Float latitude;
  final int radius;
  final String gambar;

  Fasilitas(
      {this.id_fasilitas,
      this.nama_fasilitas,
      this.jenis_fasilitas,
      this.longitude,
      this.latitude,
      this.radius,
      this.gambar});

  factory Fasilitas.fromJson(Map<String, dynamic> json) {
    return Fasilitas(
      id_fasilitas: json['id_fasilitas'],
      nama_fasilitas: json['nama_fasilitas'],
      jenis_fasilitas: json['jenis_fasilitas'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      radius: json['radius'],
      gambar: json['gambar_fasilitias'],
    );
  }
}
