part of 'weather_bloc.dart';

class WeatherState {
  final LoadingStatus status;
  final WeatherEntity? weatherInfo;
  WeatherState({
    required this.status,
    required this.weatherInfo,
  });

  WeatherState copyWith({
    LoadingStatus? status,
    WeatherEntity? weatherInfo,
  }) {
    return WeatherState(
      status: status ?? this.status,
      weatherInfo: weatherInfo ?? this.weatherInfo,
    );
  }

  @override
  String toString() => 'WeatherState(status: $status, weatherInfo: $weatherInfo)';

  @override
  bool operator ==(covariant WeatherState other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.weatherInfo == weatherInfo;
  }

  @override
  int get hashCode => status.hashCode ^ weatherInfo.hashCode;
}

enum LoadingStatus {
  pure,
  loading,
  failure,
  success,
}
