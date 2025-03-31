import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:riverpod_practice/getx/beginner/bit_coin_app/utils/serve_constants.dart';

class HTTPService {
  final Dio _dio = Dio();

  HTTPService() {
    _configureDio();
  }

  void _configureDio() {
    _dio.options = BaseOptions(
        baseUrl: ServerConstants().baseUrl,
        queryParameters: {"api_key": ServerConstants().apiKey});
  }

  Future<dynamic> get(String path) async {
    try {
      Response response = await _dio.get(path);
      return response.data;
    } catch (e) {
      log(e.toString());
    }
  }
}
