import 'package:bloc/bloc.dart';
import '../../data/models/weather_model.dart';
import '../../data/repositories/weather_repo.dart';
import 'package:equatable/equatable.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepo weatherRepo;
  WeatherBloc({required this.weatherRepo}) : super(WeatherIsNotSearched()) {
    on<WeatherEvent>(
      (event, emit) async {
        if (event is FetchWeather) {
          emit(WeatherIsLoading());
          try {
            WeatherModel weather = await weatherRepo.getWeather(event.city);
            emit(WeatherIsLoaded(weatherModel: weather)); 
          } catch (error) {
            print(error);
            emit(WeatherLoadingFailed());
          }
        } else if (event is ResetWeather) {
          emit(WeatherIsNotSearched());
        }
      },
    );
  }
}
