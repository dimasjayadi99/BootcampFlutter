void main(){
  Segitiga(alas: 20.0, tinggi: 30.0).hitungLuas();
}

class Segitiga{
  final double alas;
  final double tinggi;

  Segitiga({required this.alas, required this.tinggi});

  void hitungLuas(){
    const double setengah = 0.5;
    var hitung = setengah * alas * tinggi;
    print('Luas segitiga dari alas ($alas) * tinggi ($tinggi) : $hitung');
  }

}