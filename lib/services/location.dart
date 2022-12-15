import 'package:clima/utilits/constants.dart';
import 'package:geolocator/geolocator.dart';

class LocationServices{
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    }catch(e){
      print(e);
    }
  }
}