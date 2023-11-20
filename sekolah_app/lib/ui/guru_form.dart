import 'package:flutter/material.dart';
import '../model/guru.dart';
import '../service/guru_service.dart';
import 'guru_detail.dart';

class GuruForm extends StatefulWidget {
  const GuruForm({Key? key}) : super(key: key);
  _GuruFormState createState() => _GuruFormState();
}

class _GuruFormState extends State<GuruForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaGuruCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Guru")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [_fieldNamaGuru(), SizedBox(height: 20), _tombolSimpan()],
          ),
        ),
      ),
    );
  }

  _fieldNamaGuru() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Guru"),
      controller: _namaGuruCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () async {
          Guru guru = new Guru(namaGuru: _namaGuruCtrl.text);
          await GuruService().simpan(guru).then((value) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => GuruDetail(guru: value)));
          });
        },
        child: const Text("Simpan"));
  }
}
