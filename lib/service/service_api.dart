
import 'package:dio/dio.dart';
import 'package:meu_site/models/repository_list.dart';

class ServiceApi {
  final Dio dio = Dio();

  Future getReq() async {
    Response req = await dio.get('https://api.github.com/users/AlissonCpx/repos');
    return req.data;
  }
}