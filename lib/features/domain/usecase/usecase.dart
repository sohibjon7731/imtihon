import 'package:weather/core/either/either.dart';
import 'package:weather/core/failure/failure.dart';
import 'package:weather/core/usecase/usecase.dart';
import 'package:weather/features/domain/entity/weather.dart';
import 'package:weather/features/domain/repository/weather.dart';


class GetWeatherInfoUseCase implements UseCase<WeatherEntity, NoParams> {
  final WeatherRepository _weatherRepository;
  GetWeatherInfoUseCase(WeatherRepository weatherRepository)
      : _weatherRepository = weatherRepository;
  @override
  Future<Either<Failure, WeatherEntity>> call(NoParams params) async {
    return await _weatherRepository.getWeather();
  }
}
