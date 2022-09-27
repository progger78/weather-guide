import '../../../core/constants/size_config.dart';
import '../../../core/themes/app_theme.dart';
import '../../../data/models/weather_model.dart';
import '../../../logic/bloc/weather_bloc.dart';
import '../../widgets/custom_app_button.dart';
import '../../widgets/shader_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  TextEditingController _cityController = TextEditingController();

  @override
  void dispose() {
    _cityController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Image.asset(
              'assets/images/4267109.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Spacer(),
                BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    if (state is WeatherIsLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppTheme.primaryAppColor,
                        ),
                      );
                    }
                    if (state is WeatherIsNotSearched) {
                      return SizedBox(
                        child: Column(
                          children: [
                            ShaderText(
                                text: 'Search weather wherever you want'),
                            SizedBox(height: SizeConfig.screenHeight * 0.1),
                            TextField(
                              autofocus: true,
                              cursorColor: AppTheme.primaryAppColor,
                              style: TextStyle(
                                  fontSize: getProportionateScreenHeight(30)),
                              controller: _cityController,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    fontSize: getProportionateScreenHeight(30)),
                                hintText: 'City name',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        getProportionateScreenHeight(10))),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                     
                                      color: AppTheme.primaryAppColor, width: 2),
                                  borderRadius: BorderRadius.circular(
                                    getProportionateScreenHeight(10),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.screenHeight * 0.1),
                            CustomAppButton(
                              press: () {
                                context.read<WeatherBloc>().add(
                                    FetchWeather(city: _cityController.text));
                              },
                              width: double.maxFinite,
                              child: Text(
                                'Search',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: getProportionateScreenHeight(26)),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    if (state is WeatherIsLoaded) {
                      return SearchedWeather(
                        controller: _cityController,
                        weather: state.weatherModel,
                      );
                    }

                    return AlertDialog(
                      backgroundColor: AppTheme.lightPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          getProportionateScreenHeight(20),
                        ),
                      ),
                      title: Text(
                        'Something went wrong',
                        style: TextStyle(
                          color: AppTheme.primaryAppColor,
                          fontSize: getProportionateScreenHeight(30),
                        ),
                      ),
                      content: Text(
                        'Cound not find weather for this city',
                        style: TextStyle(
                            fontSize: getProportionateScreenHeight(20)),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            context.read<WeatherBloc>().add(ResetWeather());
                            _cityController.clear();
                          },
                          child: Text(
                            'Okay',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: getProportionateScreenHeight(22),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
                Spacer(flex: 2),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SearchedWeather extends StatelessWidget {
  const SearchedWeather(
      {super.key, required this.weather, required this.controller});
  final WeatherModel weather;

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShaderText(
          text: controller.text,
        ),
        SizedBox(
          height: getProportionateScreenHeight(15),
        ),
        _temeratureElement(
            title: 'Temperature', temperature: weather.getTemp!.round()),
        SizedBox(
          height: getProportionateScreenHeight(15),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _temeratureElement(
                title: 'Min', temperature: weather.getMinTemp!.round()),
            _temeratureElement(
                title: 'Feels like',
                temperature: weather.getFeelsLike!.round()),
            _temeratureElement(
                title: 'Max', temperature: weather.getMaxTemp!.round()),
          ],
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.07),
        CustomAppButton(
          press: () {
            context.read<WeatherBloc>().add(ResetWeather());
            controller.clear();
          },
          width: double.maxFinite,
          child: Text(
            'Search',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenHeight(26)),
          ),
        ),
      ],
    );
  }

  Column _temeratureElement({String? title, int? temperature}) {
    return Column(
      children: [
        Text(
          title!,
          style: TextStyle(
              color: AppTheme.primaryAppColor,
              fontSize: getProportionateScreenHeight(25)),
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        Container(
          padding: EdgeInsets.all(getProportionateScreenHeight(20)),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white.withOpacity(0.7)),
              shape: BoxShape.circle,
              gradient: AppTheme.mainLinearGradientBackwards),
          child: Text(
            '${temperature.toString()}C',
            style: TextStyle(
                fontSize: getProportionateScreenHeight(23),
                color: Colors.white),
          ),
        )
      ],
    );
  }
}
