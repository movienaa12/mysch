import 'package:flutter/material.dart';
import '../model/guru.dart';
import '../service/guru_service.dart';
import 'guru_detail.dart';
import 'guru_form.dart';
import 'guru_item.dart';
import '../widget/sidebar.dart';

class GuruPage extends StatefulWidget {
  const GuruPage({Key? key}) : super(key: key);
  _GuruPageState createState() => _GuruPageState();
}

class _GuruPageState extends State<GuruPage> {
  Stream<List<Guru>> getList() async* {
    List<Guru> data = await GuruService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text("Data Guru"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => GuruForm()));
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: getList(),
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
            return Text('Data Kosong');
          }

          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return GuruItem(guru: snapshot.data[index]);
            },
          );
        },
      ),
    );
  }
}
