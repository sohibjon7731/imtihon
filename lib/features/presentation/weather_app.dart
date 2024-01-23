import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:weather/assets/constants/colors.dart';
import 'package:weather/assets/constants/icons.dart';
import 'package:weather/features/presentation/bloc/weather_bloc.dart';
import 'package:weather/features/presentation/widgets/error.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        body: Stack(
          children: [
            Image.asset(
              AppIcons.image,
              fit: BoxFit.cover,
            ),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state.status == LoadingStatus.pure) {
                  context.read<WeatherBloc>().add(WeatherEventStarted());
                  return const SizedBox();
                } else if (state.status == LoadingStatus.failure) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const ErrorPage()));
                } else if (state.status == LoadingStatus.loading) {
                  return const Center(child: CupertinoActivityIndicator());
                }
                return SafeArea(
                    child: widgetChange(
                  state.weatherInfo!.current.tempC,
                  state.weatherInfo!.current.lastUpdated,
                  state.weatherInfo!.current.condition.text,
                  state.weatherInfo!.location.name,
                  state.weatherInfo!.location.country,
                  state.weatherInfo!.current.windKph,
                  state.weatherInfo!.current.humidity,
                  state.weatherInfo!.current.cloud,
                ));
              },
            ),
          ],
        ),
      );
    });
  }
}

Widget widgetChange(double tempC, String sana, String condition, String name,
    String country, double windSpeed, int humidity, int cloud) {
  if (cloud == 50) {
    return Container(
      width: double.infinity,
      height: 320,
      margin: EdgeInsets.symmetric(horizontal: 27, vertical: 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: cloudContainer,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Container(
                  child: Text(
                    changeDate("$sana"),
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 25,
                      color: cloudText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 11.68,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppIcons.cloud),
                      SizedBox(
                        width: 31,
                      ),
                      Text(
                        "$tempC°",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 40,
                          color: cloudText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 11.64,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$condition",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 20,
                          color: cloudText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.88,
                ),
                Container(
                  child: Text(
                    "${name},${country}",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 15,
                      color: cloudText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 48.41,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Wind Speed:",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        color: cloudText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "$windSpeed km/h",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        color: cloudText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Humidity:",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        color: cloudText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "$humidity %",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        color: cloudText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Cloud:",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        color: cloudText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "$cloud %",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        color: cloudText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  } else if (tempC > 25) {
    return Container(
      width: double.infinity,
      height: 320,
      margin: EdgeInsets.symmetric(horizontal: 27, vertical: 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: sunContainer,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Container(
                  child: Text(
                    changeDate("$sana"),
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 25,
                      color: sunText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 11.68,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppIcons.sun),
                      SizedBox(
                        width: 31,
                      ),
                      Text(
                        "$tempC°",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 40,
                          color: sunText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 11.64,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$condition",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 20,
                          color: sunText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.88,
                ),
                Container(
                  child: Text(
                    "${name},${country}",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 15,
                      color: sunText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 48.41,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Wind Speed:",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        color: sunText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "$windSpeed km/h",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        color: sunText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Humidity:",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        color: sunText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "$humidity %",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        color: sunText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Cloud:",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        color: sunText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "$cloud %",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        color: sunText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  } else if (cloud == 100) {
    return Container(
      width: double.infinity,
      height: 320,
      margin: EdgeInsets.symmetric(horizontal: 27, vertical: 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: rainContainer,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Container(
                  child: Text(
                    changeDate("$sana"),
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 25,
                      color: rainText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 11.68,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppIcons.rain),
                      SizedBox(
                        width: 31,
                      ),
                      Text(
                        "$tempC°",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 40,
                          color: rainText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 11.64,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$condition",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 20,
                          color: rainText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.88,
                ),
                Container(
                  child: Text(
                    "${name},${country}",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 15,
                      color: rainText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 48.41,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Wind Speed:",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        color: rainText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "$windSpeed km/h",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        color: rainText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Humidity:",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        color: rainText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "$humidity %",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        color: rainText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Cloud:",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        color: rainText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "$cloud %",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        color: rainText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  } else
    return Container(
      width: double.infinity,
      height: 320,
      margin: EdgeInsets.symmetric(horizontal: 27, vertical: 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: redCloudContainer,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Container(
                  child: Text(
                    changeDate("$sana"),
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 25,
                      color: redCloudText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 11.68,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppIcons.redCloud),
                      SizedBox(
                        width: 31,
                      ),
                      Text(
                        "$tempC°",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 40,
                          color: redCloudText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 11.64,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$condition",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 20,
                          color: redCloudText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.88,
                ),
                Container(
                  child: Text(
                    "${name},${country}",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 15,
                      color: redCloudText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 48.41,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Wind Speed:",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        color: redCloudText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "$windSpeed km/h",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        color: redCloudText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Humidity:",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        color: redCloudText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "$humidity %",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        color: redCloudText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Cloud:",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        color: redCloudText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "$cloud %",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        color: redCloudText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
}

String changeDate(String data) {
  DateTime inputDate = DateTime.parse(data);

  String formattedDate = DateFormat('dd MMMM yyyy').format(inputDate);
  return formattedDate;
}
