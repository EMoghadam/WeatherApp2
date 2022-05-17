import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'Initialise.dart';
import 'SetCity.dart';
import 'location.dart';

class HomePage extends StatefulWidget {
  const HomePage(this.locationData);

  final locationData;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Initialises initialises;

  Locations location = Locations();
  late var cityname;
  var tm = DateTime.now();

  Future resetcity(String cityname) async {
    if (cityname != null &&cityname!="") {
      initialises = Initialises(await location.getCityweather(cityname));
    }else{

    }
    setState(() {
    });
  }

  getdate() {
    String? month;

    switch (tm.month) {
      case 1:
        return "january";
      case 2:
        return "february";
      case 3:
        return "march";
      case 4:
        return "april";
      case 5:
        return "may";
      case 6:
        return "june";
      case 7:
        return "july";
      case 8:
        return "august";
      case 9:
        return "september";
      case 10:
        return "october";
      case 11:
        return "november";
      case 12:
        return "december";
    }
  }

  getday() {

    switch (tm.weekday) {
      case 1:
        return "monday";
      case 2:
        return "tuesday";
      case 3:
        return "wednesday";
      case 4:
        return "thursday";
      case 5:
        return "friday";
      case 6:
        return "saturday";
      case 7:
        return "sunday";
    }
  }

  @override
  void initState() {
    super.initState();
    print("===========================================>>>>>>>>>>.");
    initialises = Initialises(widget.locationData);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: NeumorphicBackground(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RawMaterialButton(
                          child: const Icon(
                            Icons.search,
                            color: Color(0xffFFC938),
                          ),
                          elevation: 6.0,
                          disabledElevation: 6.0,
                          onPressed: () async {
                            cityname = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SetCity()));
                            await resetcity(cityname);

                          },
                          constraints: const BoxConstraints.tightFor(
                              width: 56.5, height: 56.0),
                          shape: const CircleBorder(),
                          fillColor: const Color(0xff484DA1),
                        ),
                        RawMaterialButton(
                          child: const Icon(
                            Icons.location_on,
                            color: Color(0xffFFC938),
                          ),
                          elevation: 6.0,
                          disabledElevation: 6.0,
                          onPressed: () async {
                            initialises = await Initialises(
                                await location.getLocationData());
                            setState(() {});
                          },
                          constraints: const BoxConstraints.tightFor(
                              width: 56.5, height: 56.0),
                          shape: const CircleBorder(),
                          fillColor: const Color(0xff484DA1),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 15,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 30),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      " ${initialises.temp}℃",
                                      style: const TextStyle(
                                          color: Color(0xffFFC938),
                                          fontSize: 40),
                                    ),
                                    Text(
                                      "${location.getWeatherIcon(initialises.condition ?? 0).toString()}",
                                      style: TextStyle(fontSize: 60),
                                    )
                                  ],
                                ),
                                SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          " ${initialises.city.toString().toUpperCase()}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 25),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          " ${initialises.country.toString().toUpperCase()}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 25),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          " ${getdate().toString().toUpperCase()} - ${getday().toString().toUpperCase()}",
                                          style: const TextStyle(
                                              color: Color(0xffFFC938),
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                            decoration: const BoxDecoration(
                                color: Color(0xff484DA1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          )
                          // Neumorphic(
                          //   style: NeumorphicStyle(
                          //       shape: NeumorphicShape.flat,
                          //       boxShape: NeumorphicBoxShape.roundRect(
                          //           BorderRadius.circular(12)),
                          //       depth: 10,
                          //       border: const NeumorphicBorder(
                          //           width: 10,
                          //           isEnabled: false,
                          //           color: Colors.black),
                          //       lightSource: LightSource.topLeft,
                          //       color: Colors.white54),
                          //   child: Padding(
                          //       padding: const EdgeInsets.all(25),
                          //       child: Container(
                          //         height: 300,
                          //         alignment: Alignment.center,
                          //         child: Column(
                          //           mainAxisAlignment: MainAxisAlignment.center,
                          //           children: [
                          //             Text(
                          //               " ${location.getWeatherIcon(initialises.condition ?? 0)}",
                          //               style: const TextStyle(
                          //                   fontSize: 25,
                          //                   color: Color(0xff00154C),
                          //                   fontWeight: FontWeight.bold),
                          //             ),
                          //             Text(
                          //               "Temp : ${initialises.temp}",
                          //               style: const TextStyle(
                          //                   fontSize: 25,
                          //                   color: Color(0xff00154C),
                          //                   fontWeight: FontWeight.bold),
                          //             ),
                          //             Text(
                          //               "Status : ${initialises.status}",
                          //               style: const TextStyle(
                          //                   fontSize: 25,
                          //                   color: Color(0xff00154C),
                          //                   fontWeight: FontWeight.bold),
                          //             ),
                          //             Text(
                          //               "City : ${initialises.city}",
                          //               style: const TextStyle(
                          //                   fontSize: 25,
                          //                   color: Color(0xff00154C),
                          //                   fontWeight: FontWeight.bold),
                          //             ),
                          //             Text(
                          //               "Country : ${initialises.country}",
                          //               style: const TextStyle(
                          //                   fontSize: 25,
                          //                   color: Color(0xff00154C),
                          //                   fontWeight: FontWeight.bold),
                          //             ),
                          //             Text(
                          //               "Description : ${initialises.dec}",
                          //               style: const TextStyle(
                          //                   fontSize: 20,
                          //                   color: Color(0xff00154C),
                          //                   fontWeight: FontWeight.bold),
                          //             )
                          //           ],
                          //         ),
                          //       )),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
