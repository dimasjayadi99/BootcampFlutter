import 'armor_titan.dart';
import 'attack_titan.dart';
import 'beast_titan.dart';
import 'human.dart';

void main(){
  var armorTitan = ArmorTitan();
  armorTitan.setPowerPoint(5.0);
  print('Armor Titan : ${armorTitan.terjang()} with power point ${armorTitan.getPowerPoint()}');

  var attackTitan = AttackTitan();
  attackTitan.setPowerPoint(2.0);
  print('Attack Titan : ${attackTitan.punch()} with power point ${attackTitan.getPowerPoint()}');

  var beastTitan = BeastTitan();
  beastTitan.setPowerPoint(8.0);
  print('Beast Titan : ${beastTitan.lempar()} with power point ${beastTitan.getPowerPoint()}');

  var human = Human();
  human.setPowerPoint(6.0);
  print('Human : ${human.killAllTitan()} with power point ${human.getPowerPoint()}');

}