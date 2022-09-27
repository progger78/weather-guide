part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherEvent {
  final String city;

  FetchWeather({required this.city});
  @override
  // TODO: implement props
  List<Object> get props => [city];
}

class ResetWeather extends WeatherEvent {}
