import 'dart:io';

void main() {
  stdout.write('Ingresa n1: ');
  double n1 = double.parse(stdin.readLineSync()!);

  stdout.write('Ingresa n2: ');
  double n2 = double.parse(stdin.readLineSync()!);

  double suma = n1 + n2;

  print("=== Resultado ===");
  print(suma);
}
