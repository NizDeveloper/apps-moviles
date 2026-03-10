import 'dart:io';

int factorial(n) {
  if (n == 1) return 1;
  else return n * factorial(n-1);
}

main() {
  int n = 0;

  print('Ingrese un numero para calcular su factorial: ');
  n = int.parse(stdin.readLineSync()!);

  print(factorial(n));
}
