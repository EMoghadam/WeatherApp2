import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'NetworkHelper.dart';

class Locations {
  late double longitude;

  late double latitude;

  String keyapi = "4bc298190aa264d30c38dc36bcdbf9bb";
  String sitevalue = "https://api.openweathermap.org/data/2.5/weather";

   getCityweather(String cityname) async {
    Networking networkingcity =
        Networking("$sitevalue?q=$cityname&lang=en&appid=$keyapi&units=metric");
    var weatherdatacity = await networkingcity.getdata();
    return weatherdatacity;
  }

  Future<void> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude = position.latitude;
    longitude = position.longitude;
  }

   getLocationData() async {
    await getCurrentLocation();
    print("=========================>>>>>>>>>>>>>>> $longitude + $latitude");

    Networking networking = Networking(
        "$sitevalue?lat=$latitude&lon=$longitude&lang=en&appid=$keyapi&units=metric");

    var weaderdata = await networking.getdata();
    return weaderdata;
  }

  String getWeatherIcon(int condition) {
    if (condition == 0) {
      return '๐ค';
    }else if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(double temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
