import 'package:flutter/material.dart';
import 'package:clima/utilits/constants.dart';

import 'location_screen.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  var cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover
          )
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(15, 30, 15, 10),
                child:  TextField(
                  onChanged: (value){
                    cityName = value;
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: kTextFieldStyle,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: null,
              ),
              TextButton(
                  onPressed: (){
                    Navigator.pop(context, cityName);
                  },
                  child: Text('Get Weather', style: kButtonTextStyle,)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
