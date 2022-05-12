import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SetCity extends StatefulWidget {
  const SetCity({Key? key}) : super(key: key);

  @override
  State<SetCity> createState() => _SetCityState();
}

class _SetCityState extends State<SetCity> {
  late String city;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Color(0xff484DA1),
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context, "");
            },
          ),
          backgroundColor: Color(0xffFFC938),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                TextField(
                  style:
                      const TextStyle(color: Color(0xffFFC938), fontSize: 25),
                  onChanged: (value) {
                    city = value;
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xff484DA1),
                    icon: Icon(
                      Icons.home_work_outlined,
                      color: Color(0xff484DA1),
                      size: 40,
                    ),
                    hintText: "  Enter City Name",
                    hintStyle:
                        TextStyle(color: Color(0xbbFFC938), fontSize: 25),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  child: const Text(
                    "Set City",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffFFC938),
                    ),
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
