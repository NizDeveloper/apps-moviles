import 'dart:io';

void factorial(n) {
  int f = 1;

  for (int i = n; i > 1; i--) {
    f = f * i;
  }

  stdout.writeln("El factorial de $n es: $f");
}

main() {
  int n = 0;

  stdout.writeln('Ingrese un numero para calcular su factorial: ');
  n = int.parse(stdin.readLineSync()!);

  factorial(n);
}
