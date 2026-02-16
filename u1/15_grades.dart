import 'dart:io';

main(){
  bool entradaValida = false;
  String? calificacion;

  print('PROGRAMA DE CALIFICACIONES GRINGAS');

  while (!entradaValida) {
    stdout.write('Ingrese su calificación en el formato americano: ');
    calificacion = stdin.readLineSync()?.toUpperCase();

    if(calificacion == 'A+' || calificacion == 'A' || calificacion == 'B' || calificacion == 'C' || calificacion == 'D' || calificacion == 'F') {
        entradaValida = true;

        switch(calificacion) {
          case 'A+':
            print('Felicidades su calificación es A+, osea un 10');
          break;

          case 'B':
            print('Usted sacó una B, osea un 8');
          break;

          case 'C':
            print('Usted sacó una C, osea un 7');
          break;

          case 'D':
            print('Usted sacó una D, osea un 6');
          break;

          case 'F':
            print('Usted sacó una F, osea un 5, reprobó');
          break;

          case 'A':
            print('Usted sacó una A, osea un 9');
          break;
        }
    } else {
      print('Error, debe ingresar una letra en el rango de (A+, A, B, C, D, F)\n');
    }
  }
}
