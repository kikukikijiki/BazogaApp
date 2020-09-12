class Promo {
  final String id_promo;
  final String nama_promo;
  final DateTime periode_mulai;
  final DateTime periode_berakhir;
  final String deskripsi;
  final String gambar;

  Promo(
      {this.id_promo,
      this.nama_promo,
      this.periode_mulai,
      this.periode_berakhir,
      this.deskripsi,
      this.gambar});

  factory Promo.fromJson(Map<String, dynamic> json) {
    return Promo(
      id_promo: json['id_promo'],
      nama_promo: json['nama_promo'],
      periode_mulai: DateTime.parse(json['periode_mulai']),
      periode_berakhir: DateTime.parse(json['periode_berakhir']),
      deskripsi: json['deskripsi_promo'],
      gambar: json['gambar_promo'],
    );
  }
}
