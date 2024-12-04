void main(){
  // print teriak() function for number 1
  print(teriak());
  print('');

  // call kalikan() function for number 2
  var num1 = 12;
  var num2 = 4;
  print('Hasil Perkalian $num1 * $num2 adalah ${kalikan(num1, num2)}');
  print('');

  // call introduce() function for number 3
  var name = 'Agus';
  var age = 30;
  var address = 'Jln. Malioboro, Yogyakarta';
  var hobby = 'Gaming';

  print(introduce(name, age, address, hobby));
  print('');

  // call factorialProgram() for number 4
  var number = 6;
  print('Factorial dari $number adalah ${factorialProgram(number)}');
}

/// soal nomer 1 : membuat fungsi yang mengembalikan nilai String
teriak(){
  return 'Halo Sanbers!';
}

/// soal nomer 2 : membuat fungsi yang mengembalikan hasil perkalian
kalikan(int number1, int number2){
  return number1 * number2;
}

/// soal nomer 3 : membuat fungsi introduction dengan parameter name, age, address, hobby
introduce(String name, int age, String address, String hobby){
  String message = 'Nama saya $name, umur saya $age tahun, alamat saya di $address, dan saya punya hobby yaitu $hobby!';
  return message;
}

/// soal nomer 4 : membuat fungsi faktorial
factorialProgram(int number){
  int result = 1;
  for(int i = 1; i <= number; i++){
    result *= i;
  }

  return result;
}