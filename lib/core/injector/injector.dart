import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/features/data/data_source/weather_data_source.dart';
import 'package:weather/features/data/repository/weather.dart';
import 'package:weather/features/domain/usecase/usecase.dart';

final serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  serviceLocator.registerSingletonAsync(
    () async => await SharedPreferences.getInstance(),
  );

  serviceLocator.registerLazySingleton(
      () => Dio(BaseOptions(baseUrl: 'https://api.weatherapi.com/v1')));
  serviceLocator.registerLazySingleton(() => WeatherNetworkDataSource());
  serviceLocator.registerLazySingleton(
      () => WeatherRepositoryImpl(remoteDataSource: serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => GetWeatherInfoUseCase(serviceLocator()));
}
