import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skills_test/bloc/car_bloc/car_event.dart';
import 'package:flutter_skills_test/bloc/car_bloc/car_state.dart';
import 'package:flutter_skills_test/model/Vehicle.dart';
import 'package:flutter_skills_test/services/api.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  VehicleGET vehicleGET;

  CarBloc({@required this.vehicleGET}) : super(null);

  @override
  Stream<CarState> mapEventToState(CarEvent event) async* {
    if (event is FetchCarsEvent) {
      yield CarLoadingState();
      try {
        List<Cars> cars = await vehicleGET.getVehicle();
        yield CarLoadedState(cars: cars);
      } catch (e) {
        yield CarErrorState(message: e.toString());
      }
    }
  }
}
