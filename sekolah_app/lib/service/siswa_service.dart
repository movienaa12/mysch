import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../model/siswa.dart';

class SiswaService {
  Future<List<Siswa>> listData() async {
    final Response response = await ApiClient().get('siswa');
    final List data = response.data as List;
    List<Siswa> result = data.map((json) => Siswa.fromJson(json)).toList();
    return result;
  }

  Future<Siswa> simpan(Siswa siswa) async {
    var data = siswa.toJson();
    final Response response = await ApiClient().post('siswa', data);
    Siswa result = Siswa.fromJson(response.data);
    return result;
  }

  Future<Siswa> ubah(Siswa siswa, String id) async {
    var data = siswa.toJson();
    final Response response = await ApiClient().put('siswa/${id}', data);
    print(response);
    Siswa result = Siswa.fromJson(response.data);
    return result;
  }

  Future<Siswa> getById(String id) async {
    final Response response = await ApiClient().get('siswa/${id}');
    Siswa result = Siswa.fromJson(response.data);
    return result;
  }

  Future<Siswa> hapus(Siswa siswa) async {
    final Response response = await ApiClient().delete('siswa/${siswa.id}');
    Siswa result = Siswa.fromJson(response.data);
    return result;
  }
}
