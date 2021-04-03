import 'dart:convert';

import 'package:flutter_skills_test/model/Vehicle.dart';
import 'package:http/http.dart' as http;

abstract class VehicleGET {
  Future<List<Cars>> getVehicle();
}

class CarService implements VehicleGET {
  @override
  Future<List<Cars>> getVehicle() async {
    const url = "https://myfakeapi.com/api/cars";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      List<Cars> vehicle = Vehicle.fromJson(data).cars;
      return vehicle;
    }else{
      throw Exception();
    }
  }
}
