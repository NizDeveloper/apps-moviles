import 'dart:io';

main(){
  String? b = 'S';

  print('Programa para calcular areas o volumenes (en metros)');

  while( b == 'S'){
    stdout.write('Que desea calcular?(area o volumen): ');
    String? a = stdin.readLineSync()?.toLowerCase();

    if(a == 'area'){
      print('\nFiguras disponibles:');
      print('1. Circulo');
      print('2. Triangulo');
      print('3. Rectangulo');

      stdout.write('Seleccione una figura: ');
      String? figura = stdin.readLineSync()?.toLowerCase();

      switch(figura){
        case 'circulo':
        case '1':
          stdout.write('Ingrese el radio: ');
          double radio = double.parse(stdin.readLineSync()!);
          double area = 3.1416 * radio * radio;
          print('El area del circulo es: $area metros cuadrados');
        break;

        case 'triangulo':
        case '2':
          stdout.write('Ingrese la altura: ');
          double altura = double.parse(stdin.readLineSync()!);
          stdout.write('Ingrese la base: ');
          double base = double.parse(stdin.readLineSync()!);
          double area = (base * altura)/2;
          print('El area del triángulo es $area metros cuadrados');
        break;

        case 'rectangulo':
        case '3':
          stdout.write('Ingrese la altura: ');
          double altura = double.parse(stdin.readLineSync()!);
          stdout.write('Ingrese la base: ');
          double base = double.parse(stdin.readLineSync()!);
          double area = base * altura;
          print('El area del rectángulo es de $area metros cuadrados');
        break;
      }
    }

    if(a == 'volumen'){
      String vol;
      print('\nFiguras disponibles:');
      print('1. Esfera');
      print('2. Piramide');
      print('3. Cubo');

      stdout.write('Seleccione una figura: ');
      String? figura = stdin.readLineSync()?.toLowerCase();

      switch(figura) {
        case 'esfera':
        case '1':
          stdout.write('Ingrese el radio: ');
          double radio = double.parse(stdin.readLineSync()!);
          double volumen = 4/3 * 3.1416 * (radio * radio * radio);
          vol = volumen.toStringAsFixed(2);
          print('El volumen es $vol metros cubicos');
        break;

        case 'piramide':
        case '2':
          stdout.write('Ingrese la altura: ');
          double altura = double.parse(stdin.readLineSync()!);
          stdout.write('Ingrese el area de la base: ');
          double area_base = double.parse(stdin.readLineSync()!);
          double volumen = (area_base * altura)/3;
          vol = volumen.toStringAsFixed(2);
          print('El volumen es igual $vol metros cubicos');
        break;

        case 'cubo':
        case '3':
          stdout.write('Ingrese la medida de un lado: ');
          double lado = double.parse(stdin.readLineSync()!);
          double volumen = lado*lado*lado;
          vol = volumen.toStringAsFixed(2);
          print('El volumen es igual a $vol metros cubicos');
        break;
      }
    }

    stdout.write('Desea volver a repetir el programa(S/N)? ');
    b = stdin.readLineSync()?.toUpperCase();
  }
}
