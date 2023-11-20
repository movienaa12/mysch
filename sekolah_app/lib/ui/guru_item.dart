import 'package:flutter/material.dart';
import '../model/guru.dart';
import 'guru_detail.dart';

class GuruItem extends StatelessWidget {
  final Guru guru;

  const GuruItem({super.key, required this.guru});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text("${guru.namaGuru}"),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => GuruDetail(guru: guru)));
      },
    );
  }
}
