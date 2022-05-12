import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SetCity extends StatefulWidget {
  const SetCity({Key? key}) : super(key: key);

  @override
  State<SetCity> createState() => _SetCityState();
}

class _SetCityState extends State<SetCity> {
  late String city ;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Column(
              children: [
                TextField(
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                  onChanged: (value) {
                    city = value;
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xff00154C),
                    icon: Icon(
                      Icons.home_work_outlined,
                      color: Color(0xff00154C),
                      size: 40,
                    ),
                    hintText: "  Enter City Name",
                    hintStyle: TextStyle(color: Colors.white54, fontSize: 25),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide.none),
                  ),
                ),
                TextButton(
                  child: Text(
                    "Set City",
                    style: TextStyle(fontSize: 20,color: Color(0xFffFB700)),
                  ),
                  onPressed: () {
                    Navigator.pop(context, city);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
