import 'dart:io';

void main(){
  // call makeSentence for number 1
  makeSentence();
  print('');

  // call breakSentence for number 2
  breakSentence();
  print('');

  // call inputName for number 3
  inputName();
  print('');

  // call operatorAritmatika for number 4
  operatorAritmatika();
}

/// Soal nomer 1 : Membuat kalimat
void makeSentence(){
  // variable
  var first = 'dart';
  var second = 'is';
  var third = 'awesome';
  var fourth = 'and';
  var fifth = 'I';
  var sixth = 'love';
  var seventh = 'it!';

  // make a sentence
  var sentence = '$first $second $third $fourth $fifth $sixth $seventh';

  // print sentence
  print(sentence);
}

/// soal nomer 2 : Mengurai kalimat
void breakSentence(){
  // variable
  var sentence = 'I am going to be Flutter Developer';

  var first = sentence[0];
  var second = sentence[2] + sentence[3];
  var third = sentence[4] + sentence[5] + sentence[6] + sentence[7] + sentence[8] + sentence[9];
  var fourth = sentence[11] + sentence[12];
  var fifth = sentence[14] + sentence[15];
  var sixth = sentence[17] + sentence[18] + sentence[19] + sentence[20] + sentence[21] + sentence[22] + sentence[23];
  var seventh = sentence[25] + sentence[26] + sentence[27] + sentence[28] + sentence[29] + sentence[30] + sentence[31] + sentence[32] + sentence[33];

  // print output
  print('first word : ' + first);
  print('second word : ' + second);
  print('third word : ' + third);
  print('fourth word : ' + fourth);
  print('fifth word : ' + fifth);
  print('sixth word : ' + sixth);
  print('seventh word : ' + seventh);

}

/// soal nomer 3 : I/O first name and last name
void inputName(){
  print('Masukan nama depan : ');
  String? firstName = stdin.readLineSync();
  print('Masukan nama belakang : ');
  String? lastName = stdin.readLineSync();

  // print output
  print('Nama lengkap anda adalah : $firstName $lastName');

}

/// soal nomer 4 : operator aritmatika
void operatorAritmatika(){
  // variable
  var a = 5;
  var b = 10;

  // penjumlahan
  var jumlah = a + b;

  // pengurangan
  var kurang = a - b;

  // perkalian
  var kali = a * b;

  // pembagian
  var bagi = a / b;

  // print output
  print('Penjumlahan : $jumlah');
  print('Pengurangam : $kurang');
  print('Perkalian : $kali');
  print('Pembagian : $bagi');

}