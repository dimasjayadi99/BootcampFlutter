class Titan{
  late double _powerPoint;

  void setPowerPoint(value){
    _powerPoint = value < 5 ? 5 : value;
  }

  double getPowerPoint() => _powerPoint;

}