import 'package:json_annotation/json_annotation.dart';

part 'vehicle_model.g.dart';

@JsonSerializable(includeIfNull: false)
class Vehicle {
  num id;
  String car;
  @JsonKey(name: 'car_model')
  String carModel;
  @JsonKey(name: 'car_color')
  String carColor;
  @JsonKey(name: 'car_model_year')
  num carModelYear;
  @JsonKey(name: 'car_vin')
  String carVin;
  String price;
  bool availability;
  String img;

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleToJson(this);

  Vehicle(
      {this.id,
      this.car,
      this.carModel,
      this.carColor,
      this.carModelYear,
      this.carVin,
      this.price,
      this.availability,
      this.img
      });

  @override
  String toString() {
    return 'Vehicle{id: $id, car: $car, carModel: $carModel, carColor: $carColor, carModelYear: $carModelYear, carVin: $carVin, price: $price, availability: $availability, img:$img}';
  }

  //Use this static data for your screen
  static List<Vehicle> staticData() {
    return [
      Vehicle(
          id: 349,
          car: 'Kia',
          carModel: 'Rio',
          carColor: 'Aquamarine',
          carModelYear: 2013,
          carVin: 'SCFAD02A86G559263',
          price: '1171.66',
          availability: false,
          img: 'https://cars.usnews.com/static/images/Auto/izmo/i159423589/2020_kia_rio_angularfront.jpg'
          ),
      Vehicle(
          id: 356,
          car: 'Chevrolet',
          carModel: 'Tahoe',
          carColor: 'Pink',
          carModelYear: 2013,
          carVin: 'ML32A3HJ3EH199108',
          price: '2120.23',
          availability: true,
          img: 'https://cars.usnews.com/static/images/Auto/izmo/i159614301/2021_chevrolet_tahoe_angularfront.jpg'
          ),
      Vehicle(
          id: 364,
          car: 'Ford',
          carModel: 'Flex',
          carColor: 'Turquoise',
          carModelYear: 2013,
          carVin: '2C3CDXCT4FH891256',
          price: '3403.62',
          availability: true,
          img: 'https://upload.wikimedia.org/wikipedia/commons/d/dd/2013_Ford_Flex_--_07-11-2012.JPG'
          ),
      Vehicle(
          id: 534,
          car: 'Ford',
          carModel: 'Escape',
          carColor: 'Puce',
          carModelYear: 2013,
          carVin: '3GTU1YEJ8DG429824',
          price: '2752.43',
          availability: false,
          img: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2021-ford-escape-mmp-1-1595282192.jpg?crop=0.750xw:0.534xh;0.133xw,0.240xh&resize=1200:*'
          )
    ];
  }
}
