class Guru {
  String? id;
  String namaGuru;

  Guru({this.id, required this.namaGuru});

  factory Guru.fromJson(Map<String, dynamic> json) =>
      Guru(id: json["id"], namaGuru: json["nama_guru"]);

  Map<String, dynamic> toJson() => {"nama_guru": namaGuru};
}
