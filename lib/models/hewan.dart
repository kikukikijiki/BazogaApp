class Hewan {
  final String id_hewan;
  final String nama_hewan;
  final String nama_inggris;
  final String nama_ilmiah;
  final String kingdom;
  final String filum;
  final String kelas;
  final String ordo;
  final String famili;
  final String genus;
  final String spesies;
  final String peta_penyebaran;
  final String makanan;
  final String habitat;
  final String tren_populasi;
  final String status_konservasi;
  final String ancaman;
  final String fun_facts;
  final String gambar;

  Hewan(
      {this.id_hewan,
      this.nama_hewan,
      this.nama_inggris,
      this.nama_ilmiah,
      this.kingdom,
      this.filum,
      this.kelas,
      this.ordo,
      this.famili,
      this.genus,
      this.spesies,
      this.peta_penyebaran,
      this.makanan,
      this.habitat,
      this.tren_populasi,
      this.status_konservasi,
      this.ancaman,
      this.fun_facts,
      this.gambar});

  factory Hewan.fromJson(Map<String, dynamic> json) {
    return Hewan(
      id_hewan: json['id_hewan'],
      nama_hewan: json['nama_hewan'],
      nama_inggris: json['nama_inggris'],
      nama_ilmiah: json['nama_ilmiah'],
      kingdom: json['kingdom'],
      filum: json['filum'],
      kelas: json['kelas'],
      ordo: json['ordo'],
      famili: json['famili'],
      genus: json['genus'],
      spesies: json['spesies'],
      peta_penyebaran: json['peta_penyebaran'],
      makanan: json['makanan'],
      habitat: json['habitat'],
      tren_populasi: json['tren_populasi'],
      status_konservasi: json['status_konservasi'],
      ancaman: json['ancaman'],
      fun_facts: json['fakta_menarik'],
      gambar: json['gambar_hewan'],
    );
  }
}
