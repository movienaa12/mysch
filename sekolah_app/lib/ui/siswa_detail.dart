import 'package:flutter/material.dart';
import '../service/siswa_service.dart';
import 'siswa_page.dart';
import 'siswa_update_form.dart';
import '../model/siswa.dart';

class SiswaDetail extends StatefulWidget {
  final Siswa siswa;

  const SiswaDetail({Key? key, required this.siswa}) : super(key: key);

  @override
  _SiswaDetailState createState() => _SiswaDetailState();
}

class _SiswaDetailState extends State<SiswaDetail> {
  Stream<Siswa> getData() async* {
    Siswa data = await SiswaService().getById(widget.siswa.id.toString());
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Siswa")),
      body: StreamBuilder(
        stream: getData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Text('Data Tidak Ditemukan');
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Center(
                  child: Container(
                    width: 90,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(
                          "${snapshot.data.fotoSiswa}",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nama Siswa : ${snapshot.data.namaSiswa}",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "Kelas Siswa : ${snapshot.data.kelasSiswa}",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "Alamat Siswa : ${snapshot.data.alamatSiswa}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _tombolUbah(),
                    _tombolHapus(),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _tombolUbah() {
    return StreamBuilder(
      stream: getData(),
      builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SiswaUpdateForm(siswa: snapshot.data),
            ),
          );
        },
        style: ElevatedButton.styleFrom(primary: Colors.green),
        child: const Text("Ubah"),
      ),
    );
  }

  _tombolHapus() {
    return ElevatedButton(
      onPressed: () {
        AlertDialog alertDialog = AlertDialog(
          content: const Text("Yakin ingin menghapus data ini?"),
          actions: [
            StreamBuilder(
              stream: getData(),
              builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
                onPressed: () async {
                  await SiswaService().hapus(snapshot.data).then((value) {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SiswaPage()),
                    );
                  });
                },
                child: const Text("YA"),
                style: ElevatedButton.styleFrom(primary: Colors.red),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Tidak"),
              style: ElevatedButton.styleFrom(primary: Colors.green),
            )
          ],
        );
        showDialog(context: context, builder: (context) => alertDialog);
      },
      style: ElevatedButton.styleFrom(primary: Colors.red),
      child: const Text("Hapus"),
    );
  }
}
