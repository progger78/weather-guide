part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherIsNotSearched extends WeatherState {}

class WeatherIsLoading extends WeatherState {}

class WeatherIsLoaded extends WeatherState {
  final WeatherModel weatherModel;
  

  WeatherIsLoaded({required this.weatherModel});

  @override
  List<Object> get props => [weatherModel];
}

class WeatherLoadingFailed extends WeatherState {}
