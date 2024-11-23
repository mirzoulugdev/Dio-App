import 'package:dio/dio.dart';
import 'package:dio_app/data/model/currency_model.dart';

class ApiServices {
  Future<List<CurrencyModel>> getData() async {
    const String url = "https://nbu.uz/en/exchange-rates/json/";
    final dio = Dio();

    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        List<CurrencyModel> data = [];

        for (final currency in response.data) {
          data.add(CurrencyModel.fromJson(currency));
        }

        return data;
      } else {
        throw Exception("Info not found!");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
