void main() {
  var lingkaran = Lingkaran();

  // positive
  lingkaran.ruas = 10.0;
  print('Luas lingkaran dengan ruas (${lingkaran.ruas}): ${lingkaran.hitungLuas()}');

  // negative
  lingkaran.ruas = -7.0;
  print('Luas lingkaran dengan ruas (${lingkaran.ruas}): ${lingkaran.hitungLuas()}');
}

class Lingkaran {
  late double _ruas;

  double get ruas => _ruas;

  set ruas(double value) {
    if (value < 0) {
      _ruas = value * -1;
    } else {
      _ruas = value;
    }
  }

  double hitungLuas(){
    const double phi = 3.14;
    return phi * _ruas * _ruas;
  }
}
