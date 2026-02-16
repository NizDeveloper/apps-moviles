import 'dart:io';

main(){
  double res = 0;
  double? x;
  print('PROGRAMA QUE SUMA NUMEROS X UNA N CANTIDAD DE VECES');

  while(x != 0){
    try{
      stdout.write('Ingrese un numero X o el 0 si quiere que el programa termine: ');
      x = double.parse(stdin.readLineSync()!);
      res += x;
    } catch(e) {
      print('Error: Debe ingresar un numero');
    }
  }
  print('La suma es $res');
}
