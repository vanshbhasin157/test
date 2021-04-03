import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skills_test/bloc/car_bloc/car_bloc.dart';
import 'package:flutter_skills_test/bloc/car_bloc/car_event.dart';
import 'package:flutter_skills_test/bloc/car_bloc/car_state.dart';

class Vehicles extends StatefulWidget {
  static String tag = "/vehicles";

  @override
  _VehicleState createState() => _VehicleState();
}

class _VehicleState extends State<Vehicles> {
  CarBloc carBloc;
  int _current = 0;
  @override
  void initState() {
    super.initState();
    carBloc = BlocProvider.of<CarBloc>(context);
    carBloc.add(FetchCarsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Vehicles Catalog'),
        ),
        //Replace the body to implement your own screen design
        body: Container(
          // ignore: missing_return
          child: Container(
            // ignore: missing_return
            child: BlocBuilder<CarBloc, CarState>(builder: (context, state) {
              if (state is CarInitialState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CarLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CarLoadedState) {
                return ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, i) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 50),
                              height: 200,
                              width: 250,
                              color: Colors.green,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Ink(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.green, width: 10.0),
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(1000),
                                    onTap: () {
                                      setState(() {
                                          _current == state.cars.length - state.cars.length                                              ? _current = 0
                                              : _current -= 1;
                                        });
                                    },
                                    child: Icon(
                                      Icons.navigate_before,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                Text(
                                  "${state.cars[_current].car}",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 25),
                                ),
                                Ink(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.green, width: 10.0),
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                  child: InkWell(
                                    child: Icon(
                                      Icons.navigate_next,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    onTap: () {
                                       setState(() {
                                          _current == state.cars.length - 1
                                              ? _current = state.cars.length - 1
                                              : _current += 1;
                                        });
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Car Model",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        "${state.cars[_current].carModel}",
                                        style: TextStyle(fontSize: 20),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Color",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        "${state.cars[_current].carColor}",
                                        style: TextStyle(fontSize: 20),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Year",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        "${state.cars[_current].carModelYear.toString()}",
                                        style: TextStyle(fontSize: 20),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "VIN",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        "${state.cars[_current].carVin.substring(0,4)}",
                                        style: TextStyle(fontSize: 20),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Price",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        "${state.cars[_current].price}",
                                        style: TextStyle(fontSize: 20),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Avaiability",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      state.cars[_current].availability == true
                                          ? Text(
                                              "Yes",
                                              style: TextStyle(fontSize: 20),
                                            )
                                          : Text(
                                              "No",
                                              style: TextStyle(fontSize: 20),
                                            )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    });
              } else if (state is CarErrorState) {
                return Center(
                  child: Text(state.message),
                );
              }
            }),
          ),
        ));
  }
}
