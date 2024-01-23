import 'package:weather/core/either/either.dart';
import 'package:weather/core/failure/failure.dart';
import 'package:weather/features/domain/entity/weather.dart';


abstract class WeatherRepository {
  Future<Either<ServerFailure, WeatherEntity>> getWeather();
}
