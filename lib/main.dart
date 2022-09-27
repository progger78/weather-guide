import 'data/repositories/weather_repo.dart';
import 'logic/bloc/weather_bloc.dart';
import 'presentation/screens/weather_screen.dart/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constants/strings.dart';
import 'core/themes/app_theme.dart';
import 'logic/debug/app_bloc_observer.dart';
import 'presentation/router/app_router.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => WeatherBloc(weatherRepo: WeatherRepo()),
        child: WeatherScreen(),
      ),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
