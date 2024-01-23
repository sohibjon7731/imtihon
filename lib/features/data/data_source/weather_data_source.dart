import 'package:dio/dio.dart';
import 'package:weather/core/exception/exception.dart';
import 'package:weather/core/injector/injector.dart';
import 'package:weather/features/data/models/weather.dart';

abstract class WeatherNetworkDataSource {
  Future<WeatherModel> getWeather();
  factory WeatherNetworkDataSource() => _WeatherNetworkDataSource();
}

class _WeatherNetworkDataSource implements WeatherNetworkDataSource {
  final Dio dio = serviceLocator();
  @override
  Future<WeatherModel> getWeather() async {
    try {
      final response = await dio.get(
          "/current.json?key=e76d154ceb2a4e05a2c62513241901&q=Tashkent&aqi=no");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        print(response.statusCode);
        return WeatherModel.fromJson(response.data);
      } else {
        throw ServerException(
            message: response.statusMessage ?? '', code: response.statusCode!);
      }
    } on ServerException {
      rethrow;
    } catch (error) {
      print("hello $error");
      throw ServerException(message: "Something went wrong", code: 140);
    }
  }
}
