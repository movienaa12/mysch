import 'package:flutter/material.dart';
import '../model/siswa.dart';
import 'siswa_detail.dart';

class SiswaItem extends StatelessWidget {
  final Siswa siswa;

  const SiswaItem({super.key, required this.siswa});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text("${siswa.namaSiswa}"),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SiswaDetail(siswa: siswa)));
      },
    );
  }
}
