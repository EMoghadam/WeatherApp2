import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:temperatur/loading.dart';

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
  late Initialises initialises ;
  Locations location = Locations();

  Future resetcity(String cityname) async {
    setState(() async {
      if ( cityname != null) {
         initialises = Initialises(await location.getCityweather(cityname));
        print("============>>>>>>>>>>>${initialises.city}");
        print("============>>>>>>>>>>>${initialises.temp}");
        print("============>>>>>>>>>>>${initialises.status}");
        print("============>>>>>>>>>>>${initialises.condition}");
      }

    });
  }

  @override
  void initState() {
    super.initState();
    initialises =
       Initialises(widget.locationData);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: NeumorphicBackground(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NeumorphicButton(
                          child: const Icon(
                            Icons.home_work_outlined,
                            color: Color(0xff00154C),
                          ),
                          onPressed: () async {
                            var cityname = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SetCity()));
                            await resetcity(cityname);
                          },
                        ),
                        NeumorphicButton(
                          child: const Icon(
                            Icons.my_location_outlined,
                            color: Color(0xff00154C),
                          ),
                          onPressed: () async {
                            setState(() async {
                              initialises = await Initialises(
                                  await location.getLocationData());
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Neumorphic(
                          style: NeumorphicStyle(
                              shape: NeumorphicShape.flat,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(12)),
                              depth: 10,
                              border: const NeumorphicBorder(
                                  width: 10,
                                  isEnabled: false,
                                  color: Colors.black),
                              lightSource: LightSource.topLeft,
                              color: Colors.white54),
                          child: Padding(
                              padding: EdgeInsets.all(25),
                              child: Container(
                                height: 300,
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      " ${location.getWeatherIcon(initialises.condition ?? 0)}",
                                      style: const TextStyle(
                                          fontSize: 25,
                                          color: Color(0xff00154C),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Temp : ${initialises.temp}",
                                      style: const TextStyle(
                                          fontSize: 25,
                                          color: Color(0xff00154C),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Status : ${initialises.status}",
                                      style: const TextStyle(
                                          fontSize: 25,
                                          color: Color(0xff00154C),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "City : ${initialises.city}",
                                      style: const TextStyle(
                                          fontSize: 25,
                                          color: Color(0xff00154C),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Country : ${initialises.country}",
                                      style: const TextStyle(
                                          fontSize: 25,
                                          color: Color(0xff00154C),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Description : ${initialises.dec}",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Color(0xff00154C),
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ],
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
