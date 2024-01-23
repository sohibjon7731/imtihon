import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class WeatherModel {
  @JsonKey(name: "location")
  final Location location;
  @JsonKey(name: "current")
  final Current current;
  WeatherModel({
    required this.location,
    required this.current,
  });
  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

@JsonSerializable()
class Location {
  @JsonKey(name: "name", defaultValue: "")
  final String name;
  @JsonKey(name: "region", defaultValue: "")
  final String region;
  @JsonKey(name: "country", defaultValue: "")
  final String country;
  @JsonKey(name: "lat", defaultValue: 0.0)
  final double lat;
  @JsonKey(name: "lon", defaultValue: 0.0)
  final double lon;
  @JsonKey(name: "tz_id", defaultValue: "")
  final String tzID;
  @JsonKey(name: "localtime_epoch", defaultValue: 0)
  final int localtimeEpoch;
  @JsonKey(name: "localtime", defaultValue: "")
  final String localtime;
  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzID,
    required this.localtimeEpoch,
    required this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Current {
  @JsonKey(name: "last_updated", defaultValue: "")
  final String lastUpdated;
  @JsonKey(name: "temp_c", defaultValue: 0.0)
  final double tempC;
  @JsonKey(name: "is_day", defaultValue: 0)
  final int isDay;
  @JsonKey(name: "condition")
  final Condition condition;
  @JsonKey(name: "wind_kph", defaultValue: 0.0)
  final double windKph;
  @JsonKey(name: "humidity", defaultValue: 0)
  final int humidity;
  @JsonKey(name: "cloud", defaultValue: 0)
  final int cloud;
  Current({
    required this.lastUpdated,
    required this.tempC,
    required this.isDay,
    required this.condition,
    required this.windKph,
    required this.humidity,
    required this.cloud,
  });

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}

@JsonSerializable()
class Condition {
  @JsonKey(name: "text", defaultValue: "")
  final String text;
  Condition({
    required this.text,
  });
  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}
