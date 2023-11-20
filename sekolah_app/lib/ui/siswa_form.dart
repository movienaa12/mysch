import 'package:flutter/material.dart';
import '../model/siswa.dart';
import '../service/siswa_service.dart';
import 'siswa_detail.dart';

class SiswaForm extends StatefulWidget {
  const SiswaForm({Key? key}) : super(key: key);
  _SiswaFormState createState() => _SiswaFormState();
}

class _SiswaFormState extends State<SiswaForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaSiswaCtrl = TextEditingController();
  final _kelasSiswaCtrl = TextEditingController();
  final _alamatSiswaCtrl = TextEditingController();
  final _fotoSiswaCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Siswa")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNamaSiswa(),
              _fieldKelasSiswa(),
              _fieldAlamatSiswa(),
              _fieldFotoSiswa(),
              SizedBox(height: 20),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  _fieldNamaSiswa() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Siswa"),
      controller: _namaSiswaCtrl,
    );
  }

  _fieldKelasSiswa() {
    return TextField(
      decoration: const InputDecoration(labelText: "Kelas Siswa"),
      controller: _kelasSiswaCtrl,
    );
  }

  _fieldAlamatSiswa() {
    return TextField(
      decoration: const InputDecoration(labelText: "Alamat Siswa"),
      controller: _alamatSiswaCtrl,
    );
  }

  _fieldFotoSiswa() {
    return TextField(
      decoration: const InputDecoration(labelText: "Foto Siswa (URL)"),
      controller: _fotoSiswaCtrl,
    );
  }

_tombolSimpan() {
  return ElevatedButton(
    onPressed: () async {
      if (_formKey.currentState!.validate()) {
        Siswa siswa = Siswa(
          namaSiswa: _namaSiswaCtrl.text,
          kelasSiswa: _kelasSiswaCtrl.text,
          alamatSiswa: _alamatSiswaCtrl.text,
          fotoSiswa: _fotoSiswaCtrl.text,
        );
        await SiswaService().simpan(siswa).then((value) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SiswaDetail(siswa: value)),
          );
        });
      }
    },
    child: const Text("Simpan"),
  );
}
}
