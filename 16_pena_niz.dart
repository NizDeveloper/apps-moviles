import 'dart:io';

double calculateAverage(c1, c2, c3) {
  return ((c1 + c2 + c3) / 3);
}

String clasificacion(p) {
  if (p >= 90) return "Excelente";
  if (p >= 80) return "Bueno";
  if (p >= 70) return "Satisfactorio";
  return "Reprobado";
}

main() {
  stdout.write("Cuantos alumnos serán evaluados? ");
  int cantEval = int.parse(stdin.readLineSync()!);

  if (cantEval <= 0) {
    print("\nLos alumnos deben ser mayor a 0");
    return;
  }

  List<Map<String, dynamic>> dataEst = [];

  // Iniciar ciclos
  for (int i = 0; i < cantEval; i++) {
    print("Estudiante ${i + 1}/${cantEval}");

    stdout.write("Escribe el nombre del alumno: ");
    String nombre = stdin.readLineSync()!;

    List<double> calificaciones = [];

    // 3 Calificicaciones
    for (int j = 1; j <= 3; j++) {
      double? auxCal;

      while (true) {
        stdout.write("Introduzca la calificacion del examen ${j}/3: ");
        auxCal = double.parse(stdin.readLineSync()!);

        if (auxCal != null && auxCal >= 0 && auxCal <= 100) {
          calificaciones.add(auxCal);
          break;
        }

        print("Rango no valido");
      }
    }

    // Usar funciones
    double promedio = calculateAverage(
      calificaciones[0],
      calificaciones[1],
      calificaciones[2],
    );
    String clasifica = clasificacion(promedio);

    //Usar maps
    dataEst.add({
      'nombre': nombre,
      'notas': calificaciones,
      'promedio': promedio,
      'clase': clasifica,
    });
  }

  // Mostrar datos
  print("=" * 7 + " Reporte de los estudiantes " + "=" * 7);

  double totalPromedios = 0;
  double promedioBajo = 100;
  double promedioAlto = -1;

  for (var est in dataEst) {
    double promActual = est['promedio'];

    print("Estudiante: ${est['nombre']}");
    print(
      "Notas: ${est['notas']} \nPromedio: ${promActual.toStringAsFixed(2)} \nClasificación: ${est['clase']}",
    );
    print("-" * 25);

    totalPromedios += promActual;
    if (promActual > promedioAlto) promedioAlto = promActual;
    if (promActual < promedioBajo) promedioBajo = promActual;
  }

  print("=" * 7 + " Estadisticas finales " + "=" * 7);
  print("El promedio grupal: ${(totalPromedios / cantEval)}");
  print("El promedio mas alto: ${promedioAlto.toStringAsFixed(2)}");
  print("El promedio mas bajo: ${promedioBajo.toStringAsFixed(2)}");
}
