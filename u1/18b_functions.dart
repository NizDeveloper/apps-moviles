import 'dart:io';

void multiply(int numero){
  for(int c = 0; c < 10; c++){
    int r = 0;

    r = numero * c;
    stdout.write('$numero * $c = $r \n');
  }
}

main(){
  int n = 0;

  stdout.write('Ingrese un número: ');
  n = int.parse(stdin.readLineSync()!);

  multiply(n);
}
