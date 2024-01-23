import 'package:weather/core/either/either.dart';
import 'package:weather/core/exception/exception.dart';
import 'package:weather/core/failure/failure.dart';
import 'package:weather/features/data/data_source/weather_data_source.dart';
import 'package:weather/features/domain/entity/weather.dart';
import 'package:weather/features/domain/repository/weather.dart';


class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherNetworkDataSource _remoteDataSource;
  const WeatherRepositoryImpl(
      {required WeatherNetworkDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<ServerFailure, WeatherEntity>> getWeather() async {
    try {
      final response = await _remoteDataSource.getWeather();
      print(response);
      return Right(WeatherEntity.toEntity(response));
    } on ServerException catch (exception) {
      return Left(ServerFailure.fromServerException(exception));
    }
  }
}
