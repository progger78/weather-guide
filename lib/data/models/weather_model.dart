class WeatherModel {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;

  WeatherModel({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
  });

  double? get getMaxTemp => tempMax! - 275.5;
  double? get getMinTemp => tempMin! - 275.5;
  double? get getTemp => temp! - 275.5;
  double? get getFeelsLike => feelsLike! - 275.5;

  WeatherModel.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp'] = this.temp;
    data['feels_like'] = this.feelsLike;
    data['temp_min'] = this.tempMin;
    data['temp_max'] = this.tempMax;

    return data;
  }
}
