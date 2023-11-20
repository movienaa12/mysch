import 'package:flutter/material.dart';
import 'package:klinik_app/model/guru.dart';
import '../ui/beranda.dart';
import '../ui/login.dart';
import '../ui/siswa_page.dart';
import '../ui/guru_page.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text("Selamat Datang, Admin"),
              accountEmail: Text("admin@admin.com")),
          ListTile(
            leading: Icon(Icons.home_rounded),
            title: Text("Beranda"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Beranda()));
            },
          ),
          ListTile(
            leading: Icon(Icons.school_rounded),
            title: Text("Siswa"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SiswaPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.people_rounded),
            title: Text("Guru"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => GuruPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_box_rounded),
            title: Text("Staf"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout_rounded),
            title: Text("Keluar"),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                  (Route<dynamic> route) => false);
            },
          )
        ],
      ),
    );
  }
}
