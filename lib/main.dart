import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/injector/injector.dart';
import 'package:weather/features/presentation/bloc/weather_bloc.dart';
import 'package:weather/features/presentation/weather_app.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WeatherApp(),
      ),
    );
  }
}
