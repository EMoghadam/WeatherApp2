import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'NetworkHelper.dart';
import 'homePage.dart';
import 'location.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future<void> getLocationData() async {
    Locations locat = Locations();
    var data = await locat.getLocationData();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage(data)));
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SpinKitFadingCircle(
                    color: Color(0xFffFB700),
                    size: 100,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "From MoboDeveloper",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff00154C)),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
