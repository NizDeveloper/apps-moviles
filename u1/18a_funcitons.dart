import 'dart:io';

main(){
  int r = 0;

  stdout.write('Ingrese un número: ');
  int n = int.parse(stdin.readLineSync()!);

  for(int c = 0; c < 10; c++){
    r = n * c;
    print('$n * $c = $r');
  }
}
