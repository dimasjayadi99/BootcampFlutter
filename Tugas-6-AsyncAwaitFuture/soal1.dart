import 'dart:async';

void main() async {
  var h = Human();
  
  print('Luffy');
  print('Zorro');
  print('Killer');
  print(h.name);
  
  await h.getName();
  
  print(h.name);
}

class Human {
  String name = "Nama Character One Piece";
  
  Future<void> getName() async {
    await Future.delayed(Duration(seconds: 3));
    name = 'Rafi';
    print('Get data[done]');
  }
}