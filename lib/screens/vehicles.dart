import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skills_test/model/vehicle_model.dart';

class Vehicles extends StatefulWidget {
  static String tag = "/vehicles";

  @override
  _VehicleState createState() => _VehicleState();
}

class _VehicleState extends State<Vehicles> {
  List<Vehicle> vec = Vehicle.staticData();
  int _current = 0;
  String model = '';
  String color = '';
  num year;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Vehicles Catalog'),
        ),
        //Replace the body to implement your own screen design
        body: vec.isEmpty
            ? Center(
                child: Text('No Vehicles Found!!',
                    style: TextStyle(fontSize: 30.0)),
              )
            : Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int i) {
                        return Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                vec[_current].img,
                                height: 250,
                                width: 250,
                                fit: BoxFit.scaleDown,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                          _current == vec.length - vec.length
                                              ? _current = 0
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
                                    "${vec[_current].car}",
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
                                          _current == vec.length - 1
                                              ? _current = vec.length - 1
                                              : _current += 1;
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 25,
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
                                            "${vec[_current].carModel}",
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
                                            "${vec[_current].carColor}",
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
                                            "${vec[_current].carModelYear.toString()}",
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
                                            "${vec[_current].carVin}",
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
                                            "${vec[_current].price}",
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
                                          vec[_current].availability == true
                                              ? Text(
                                                  "Yes",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                )
                                              : Text(
                                                  "No",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 70, 0, 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      width: 100,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    content:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      child: Container(
                                                        height: 250,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(10.0),
                                                              child:
                                                                  TextFormField(
                                                                onChanged: (String
                                                                    text) {
                                                                  if (text
                                                                      .isEmpty) {
                                                                    setState(() {
                                                                      model = vec[
                                                                              _current]
                                                                          .carModel;
                                                                    });
                                                                  } else {
                                                                    setState(() {
                                                                      model =
                                                                          text;
                                                                    });
                                                                  }
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText:
                                                                      "Car Model",
                                                                  hintText:
                                                                      "${vec[_current].carModel}",
                                                                  fillColor:
                                                                      Colors
                                                                          .green,
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide: const BorderSide(
                                                                        color: Colors
                                                                            .green,
                                                                        width:
                                                                            2.0),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                25.0),
                                                                  ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide: const BorderSide(
                                                                        color: Colors
                                                                            .green,
                                                                        width:
                                                                            2.0),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                25.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(10.0),
                                                              child:
                                                                  TextFormField(
                                                                onChanged: (String
                                                                    text) {
                                                                  if (text
                                                                      .isEmpty) {
                                                                    setState(() {
                                                                      color = vec[
                                                                              _current]
                                                                          .carColor;
                                                                    });
                                                                  } else {
                                                                    setState(() {
                                                                      color =
                                                                          text;
                                                                    });
                                                                  }
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText:
                                                                      "Color",
                                                                  hintText:
                                                                      "${vec[_current].carColor}",
                                                                  fillColor:
                                                                      Colors
                                                                          .green,
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide: const BorderSide(
                                                                        color: Colors
                                                                            .green,
                                                                        width:
                                                                            2.0),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                25.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide: const BorderSide(
                                                                        color: Colors
                                                                            .green,
                                                                        width:
                                                                            2.0),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                25.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(10.0),
                                                              child:
                                                                  TextFormField(
                                                                onChanged: (String
                                                                    text) {
                                                                  if (text ==
                                                                      '') {
                                                                    setState(() {
                                                                      year = vec[
                                                                              _current]
                                                                          .carModelYear;
                                                                    });
                                                                  } else {
                                                                    setState(() {
                                                                      year = int
                                                                          .parse(
                                                                              text);
                                                                    });
                                                                  }
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText:
                                                                      "Car Model Year",
                                                                  hintText:
                                                                      "${vec[_current].carModelYear}",
                                                                  fillColor:
                                                                      Colors
                                                                          .green,
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide: const BorderSide(
                                                                        color: Colors
                                                                            .green,
                                                                        width:
                                                                            2.0),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                25.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide: const BorderSide(
                                                                        color: Colors
                                                                            .green,
                                                                        width:
                                                                            2.0),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                25.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    actions: [
                                                      ElevatedButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              final obj = vec.firstWhere(
                                                                  (element) =>
                                                                      element
                                                                          .id ==
                                                                      vec[_current]
                                                                          .id);
                                                              obj.carModel =
                                                                  model;
                                                              obj.carModelYear =
                                                                  year;
                                                              obj.carColor =
                                                                  color;
                                                            });
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text('Save'))
                                                    ],
                                                  );
                                                });
                                          },
                                          child: Text(
                                            "Edit",
                                            style: TextStyle(fontSize: 15),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 50,
                                      width: 100,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              vec.removeWhere((element) =>
                                                  element.id ==
                                                  vec[_current].id);
                                              if (_current ==
                                                  vec.length - vec.length) {
                                                _current = 0;
                                              } else if (_current ==
                                                  vec.length - 1) {
                                                _current = vec.length - 1;
                                              } else {
                                                _current = 0;
                                              }
                                            });
                                          },
                                          child: Text("Delete",style: TextStyle(fontSize: 15),)),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ],
              ));
  }
}
