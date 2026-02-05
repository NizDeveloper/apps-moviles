import 'dart:io';

void main() {
  stdout.write('Por favor, introduce tu nombre: ');

  String? nombre = stdin.readLineSync();

  print('Hello $nombre!');
}
