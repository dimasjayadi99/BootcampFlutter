import 'dart:async';

void main() async {
  print("Ready. sing");

  await Future.delayed(Duration(seconds: 5));
  line();

  await Future.delayed(Duration(seconds: 3));
  line2();

  await Future.delayed(Duration(seconds: 2));
  line3();

  await Future.delayed(Duration(seconds: 1));
  line4();
}

void line() {
  print("Pernahkah kau merasa");
}

void line2() {
  print("Pernahkah kau merasa ...........");
}

void line3() {
  print("Pernahkah kau merasa");
}

void line4() {
  print("Hatimu hampa, pernahkah kau merasa hati mu kosong ............");
}
