import 'package:flutter/material.dart';
import '../model/guru.dart';
import '../service/guru_service.dart';
import 'guru_detail.dart';

class GuruUpdateForm extends StatefulWidget {
  final Guru guru;

  const GuruUpdateForm({Key? key, required this.guru}) : super(key: key);
  _GuruUpdateFormState createState() => _GuruUpdateFormState();
}

class _GuruUpdateFormState extends State<GuruUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaGuruCtrl = TextEditingController();

  Future<Guru> getData() async {
    Guru data = await GuruService().getById(widget.guru.id.toString());
    setState(() {
      _namaGuruCtrl.text = data.namaGuru;
    });
    return data;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Guru")),
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
          String id = widget.guru.id.toString();
          await GuruService().ubah(guru, id).then((value) {
            Navigator.pop(context);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => GuruDetail(guru: value)));
          });
        },
        child: const Text("Simpan Perubahan"));
  }
}
