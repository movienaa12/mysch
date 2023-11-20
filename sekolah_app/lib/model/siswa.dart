class Siswa {
  String? id;
  String namaSiswa;
  String kelasSiswa;
  String alamatSiswa;
  String fotoSiswa;

  Siswa({
    this.id,
    required this.namaSiswa,
    required this.kelasSiswa,
    required this.alamatSiswa,
    required this.fotoSiswa,
  });

  factory Siswa.fromJson(Map<String, dynamic> json) => Siswa(
        id: json["id"] ?? "",
        namaSiswa: json["nama_siswa"],
        kelasSiswa: json["kelas_siswa"],
        alamatSiswa: json["alamat_siswa"],
        fotoSiswa: json["foto_siswa"],
      );

  Map<String, dynamic> toJson() => {
        "nama_siswa": namaSiswa,
        "kelas_siswa": kelasSiswa,
        "alamat_siswa": alamatSiswa,
        "foto_siswa": fotoSiswa,
      };
}
