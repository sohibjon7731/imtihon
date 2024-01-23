import 'package:equatable/equatable.dart';
import 'package:weather/features/data/models/weather.dart';

class WeatherEntity extends Equatable {
  final Location location;
  final Current current;
  const WeatherEntity({
    required this.location,
    required this.current,
  });

  factory WeatherEntity.toEntity(WeatherModel weatherModel) {
    return WeatherEntity(
        location: weatherModel.location, current: weatherModel.current);
  }

  @override
  List<Object?> get props => [location, current];
}
