import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/usecase/usecase.dart';
import 'package:weather/features/data/data_source/weather_data_source.dart';
import 'package:weather/features/data/repository/weather.dart';
import 'package:weather/features/domain/entity/weather.dart';
import 'package:weather/features/domain/usecase/usecase.dart';


part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc()
      : super(WeatherState(status: LoadingStatus.pure, weatherInfo: null)) {
    on<WeatherEventStarted>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));
      final usecase =
           await GetWeatherInfoUseCase(WeatherRepositoryImpl(remoteDataSource: WeatherNetworkDataSource())).call(const NoParams());
      
      
      usecase.either((failure) {
        emit(state.copyWith(status: LoadingStatus.failure));
      }, (weatherInfo) {
        print(weatherInfo);
        emit(state.copyWith(
            status: LoadingStatus.success, weatherInfo: weatherInfo));
      });
    });
  }
}
