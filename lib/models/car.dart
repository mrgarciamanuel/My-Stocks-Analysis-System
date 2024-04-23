//this is a simple model for testing http request
class Car {
  final String id;
  final String car;
  final String carModel;
  final String carColor;

  const Car({
    required this.id,
    required this.car,
    required this.carModel,
    required this.carColor,
  });

  factory Car.fromJson(Map<String, dynamic> jsonObj) => Car(
        id: jsonObj['id'].toString(),
        car: jsonObj['car'].toString(),
        carModel: jsonObj['car_model'].toString(),
        carColor: jsonObj['car_color'].toString(),
      );
}
