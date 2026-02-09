import 'dart:io';
import 'dart:math';

bool primos(n1) {
  if (n1 <= 1) return false;
  if (n1 == 2) return true;
  if (n1 % 2 == 0) return false;

  double limite = sqrt(n1);
  for (int i = 3; i <= limite; i += 2) {
    if (n1 % i == 0) return false;
  }
  return true;
}

main(){
  stdout.write("Ingresa un numero: ");
  int n1 = int.parse(stdin.readLineSync()!);

  print("=== Numero primo ===");
  if (primos(n1)) {
    print("El numero ${n1} es primo");
  } else {
    print("El numero ${n1} NO es primo");
  }
}
