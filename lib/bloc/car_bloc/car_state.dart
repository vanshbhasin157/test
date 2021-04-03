import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_skills_test/model/Vehicle.dart';

abstract class CarState extends Equatable {}

class CarInitialState extends CarState {
  @override
  List<Object> get props => [];
}

class CarLoadingState extends CarState {
  @override
  List<Object> get props => [];
}

class CarLoadedState extends CarState {
  List<Cars> cars;
  CarLoadedState({@required this.cars});
  @override
  List<Object> get props => throw UnimplementedError();
}

class CarErrorState extends CarState {
  
  String message;
  CarErrorState({@required this.message});
  
  @override
  
  List<Object> get props => throw UnimplementedError();
}
