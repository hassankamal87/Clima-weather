import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  color: Colors.white,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 80.0,
);

const kTextFieldStyle = InputDecoration(
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
      borderSide: BorderSide.none
  ),
  hintText: 'Enter a City Name',
  hintStyle: TextStyle(color: Colors.grey),
  fillColor: Colors.white,
  filled: true,
  icon: Icon(Icons.location_city,color: Colors.white,),
);

