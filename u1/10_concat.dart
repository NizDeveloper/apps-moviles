import 'dart:io';

void main() {
  stdout.write('Ingresa tu name: ');
  String? name = stdin.readLineSync();

  stdout.write('Ingresa tu last name: ');
  String? lastName = stdin.readLineSync();

  stdout.write('Ingresa tu middlename: ');
  String? middleName = stdin.readLineSync();

  print('Hi, $name $middleName $lastName');
}
