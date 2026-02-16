import 'dart:io';

void main() {
  stdout.write('Ingresa al n1: ');
  int n1 = int.parse(stdin.readLineSync()!);

  stdout.write('Ingresa al n2: ');
  int n2 = int.parse(stdin.readLineSync()!);

  if (n1 != n2) {
    String resultado = (n1 > n2) ? 'n1 > n2' : 'n1 < n2';
    print(resultado);
  } else {
    print("Los numeros son iguales");
  }
}
