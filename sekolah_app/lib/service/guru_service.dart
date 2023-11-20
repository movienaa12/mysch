import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../model/guru.dart';

class GuruService {
  Future<List<Guru>> listData() async {
    final Response response = await ApiClient().get('guru');
    final List data = response.data as List;
    List<Guru> result = data.map((json) => Guru.fromJson(json)).toList();
    return result;
  }

  Future<Guru> simpan(Guru guru) async {
    var data = guru.toJson();
    final Response response = await ApiClient().post('guru', data);
    Guru result = Guru.fromJson(response.data);
    return result;
  }

  Future<Guru> ubah(Guru guru, String id) async {
    var data = guru.toJson();
    final Response response = await ApiClient().put('guru/${id}', data);
    print(response);
    Guru result = Guru.fromJson(response.data);
    return result;
  }

  Future<Guru> getById(String id) async {
    final Response response = await ApiClient().get('guru/${id}');
    Guru result = Guru.fromJson(response.data);
    return result;
  }

  Future<Guru> hapus(Guru guru) async {
    final Response response = await ApiClient().delete('guru/${guru.id}');
    Guru result = Guru.fromJson(response.data);
    return result;
  }
}
