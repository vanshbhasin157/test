import 'package:equatable/equatable.dart';

abstract class CarEvent extends Equatable{

}

class FetchCarsEvent extends CarEvent{
  @override
  
  List<Object> get props => throw UnimplementedError();

}