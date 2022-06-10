import 'package:dio/dio.dart';

import '../models/cuaca_model.dart';

class CuacaService {
  late Dio _dio;

  CuacaService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.openweathermap.org/data/2.5/weather',
      ),
    );
  }

  Future<CuacaModel> tampikanCuaca({String? city}) async {
    var response = await _dio.get(
      '?q=$city&appid=f5e2dc07b7878fc22d876aee79f956a0&units=metric',
    );
    return CuacaModel.fromJson(response.data);
  }
}