import 'package:cuaca/models/cuaca_model.dart';
import 'package:cuaca/services/cuaca_service.dart';
import 'package:flutter/material.dart';

class CuacaProvider extends ChangeNotifier {
  TextEditingController inputcity = TextEditingController();
  final CuacaService _CuacaService = CuacaService();
  late CuacaModel cuacaModel;

  CuacaProvider() {
    cuacaModel = CuacaModel();
    tampilkanDataCuaca(city: 'Pamulang');
    notifyListeners();
  }
  tampilkanDataCuaca({required String city}) async {
    cuacaModel = await _CuacaService.tampikanCuaca(city: city);
    print(cuacaModel.main);
    notifyListeners();
  }
}