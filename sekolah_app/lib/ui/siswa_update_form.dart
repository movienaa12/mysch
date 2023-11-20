import 'package:flutter/material.dart';
import '../model/siswa.dart';
import '../service/siswa_service.dart';
import 'siswa_detail.dart';

class SiswaUpdateForm extends StatefulWidget {
  final Siswa siswa;

  const SiswaUpdateForm({Key? key, required this.siswa}) : super(key: key);
  _SiswaUpdateFormState createState() => _SiswaUpdateFormState();
}

class _SiswaUpdateFormState extends State<SiswaUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaSiswaCtrl = TextEditingController();
  final _kelasSiswaCtrl = TextEditingController();
  final _alamatSiswaCtrl = TextEditingController();
  final _fotoSiswaCtrl = TextEditingController();

  Future<Siswa> getData() async {
    Siswa data = await SiswaService().getById(widget.siswa.id.toString());
    setState(() {
      _namaSiswaCtrl.text = data.namaSiswa;
      _kelasSiswaCtrl.text = data.kelasSiswa;
      _alamatSiswaCtrl.text = data.alamatSiswa;
      _fotoSiswaCtrl.text = data.fotoSiswa;
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
      appBar: AppBar(title: const Text("Ubah Siswa")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [_fieldNamaSiswa(), _fieldKelasSiswa(), _fieldAlamatSiswa(), _fieldFotoSiswa(), SizedBox(height: 20), _tombolSimpan()],
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
          Siswa siswa = new Siswa(namaSiswa: _namaSiswaCtrl.text, kelasSiswa: _kelasSiswaCtrl.text, alamatSiswa: _alamatSiswaCtrl.text, fotoSiswa: _fotoSiswaCtrl.text);
          String id = widget.siswa.id.toString();
          await SiswaService().ubah(siswa, id).then((value) {
            Navigator.pop(context);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => SiswaDetail(siswa: value)));
          });
        },
        child: const Text("Simpan Perubahan"));
  }
}
