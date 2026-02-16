import 'dart:io';

main(){
  int a;
  int? b;

  while( b != 0){
    print('PROGRAMA DE MULTIPLICACIÓN');

    stdout.write('Ingrese un número: ');
    a = int.parse(stdin.readLineSync()!);

    for(int i = 1; i < 51; i++){
      int res = a*i;
      print('$a * $i = $res');
    }

    stdout.write('Si desea que el programa termine ingrese un "0"\n');
    b = int.parse(stdin.readLineSync()!);
  }
}
