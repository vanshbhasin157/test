import 'dart:convert';

import 'package:flutter_skills_test/model/vehicle_model.dart';
import 'package:flutter_skills_test/services/generic_service.dart';

class VehicleServices extends GenericService {
  static VehicleServices _instance = VehicleServices._();

  VehicleServices._();

  static Future<Vehicle> fetchVehicles() async {
    //Your Code to fetch vehicles
    return null;
  }
}
