import 'dart:io';

List<List<Celda>> laberinto = crearLaberinto();

class Celda {
  bool top, bottom, left, right;
  bool visitado, esInicio, esFinal;

  Celda()
    : top = true,
      bottom = true,
      left = true,
      right = true,
      visitado = false,
      esInicio = false,
      esFinal = false;
}

List<List<Celda>> crearLaberinto() {
  List<List<Celda>> lab = [];

  for (int i = 0; i < 6; i++) {
    List<Celda> fila = [];

    for (int j = 0; j < 10; j++) {
      fila.add(Celda());
    }

    lab.add(fila);
  }

  return lab;
}

/*
 * @brief Establece los bordes del laberinto + las celdas de inicio y fin
 */
void bordes() {
  for (int i = 0; i < 6; i++) {
    for (int j = 0; j < 10; j++) {
      if (i == 0) laberinto[0][j].top = false;
      if (i == 5 && !laberinto[i][j].esInicio) laberinto[5][j].bottom = false;
      if (j == 0) laberinto[i][0].left = false;
      if (j == 9 && !laberinto[i][j].esFinal) laberinto[i][9].right = false;
    }
  }
}

/*
 * @brief Imprime el laberinto validando paredes compartidas
 * Ahora verifica si la celda actual tiene top == false O si la celda
 * de arriba tiene bottom == false para dibujar el muro
 */
void printLaberinto() {
  List abecedario = ['A', 'B', 'C', 'D', 'E', 'F'];

  stdout.write("   ");
  for (int i = 1; i <= 10; i++) {
    stdout.write(" $i  ");
  }
  print("");

  for (int i = 0; i < 6; i++) {
    String lineaTecho = "";
    String lineaMid = "${abecedario[i]} ";

    for (int j = 0; j < 10; j++) {
      bool muroTop = !laberinto[i][j].top;

      if (i > 0 && !laberinto[i - 1][j].bottom) {
        muroTop = true;
      }

      lineaTecho += (muroTop) ? '+---' : '+   ';
      lineaMid += (!laberinto[i][j].left) ? "|   " : "    ";

      if (j == 9) {
        lineaMid += (!laberinto[i][j].right) ? "|" : " ";
      }
    }

    print("  " + lineaTecho + "+");
    print(lineaMid);
  }

  String pisoFinal = "";
  for (int j = 0; j < 10; j++) {
    pisoFinal += (!laberinto[5][j].bottom) ? "+---" : "+   ";
  }
  print("  " + pisoFinal + "+");
}

/*
 * @brief Función recursiva que resuelve el laberinto
 * @param fila = Fila actual
 * @param col = Columna actual
 * @return true si ha llegado al final, false si no
 */
bool resolver(fila, col) {
  Celda actual = laberinto[fila][col];

  // Caso base = completar laberinto
  if (actual.esFinal) return true;

  if (actual.visitado) return false;
  
  actual.visitado = true;

  print(coord(fila, col));

  // Logica de movimiento con recursividad
  // Arriba
  if (fila > 0 && actual.top && !laberinto[fila - 1][col].visitado) {
    if (resolver(fila - 1, col)) return true;
  }
  // Abajo
  if (fila < 5 && actual.bottom && !laberinto[fila + 1][col].visitado) {
    if (resolver(fila + 1, col)) return true;
  }
  // Izquierda
  if (col > 0 && actual.left && !laberinto[fila][col - 1].visitado) {
    if (resolver(fila, col - 1)) return true;
  }
  // Derecha
  if (col < 9 && actual.right && !laberinto[fila][col + 1].visitado) {
    if (resolver(fila, col + 1)) return true;
  }

  return false;
}

/*
 * @brief Convierte índices [i][j] a coordenada legible -> F2
 * @param fila = Fila actual
 * @param col = Columna actual
 */
String coord(int fila, int col) {
  List<String> abc = ['A', 'B', 'C', 'D', 'E', 'F'];
  return '[${abc[fila]}${col + 1}]';
}

void main() {
  // Contrucción del laberinto (por dentro)
  if (true) {
    //Fila A
    laberinto[0][1].left = false;
    laberinto[0][2].left = false;
    laberinto[0][3].left = false;
    laberinto[0][4].left = false;
    laberinto[0][5].left = false;
    laberinto[0][8].left = false;

    //Fila B
    laberinto[1][0].top = false;
    laberinto[1][1].top = false;
    laberinto[1][2].top = false;
    laberinto[1][6].top = false;
    laberinto[1][7].top = false;
    laberinto[1][9].top = false;
    laberinto[1][4].left = false;
    laberinto[1][5].left = false;
    laberinto[1][6].left = false;
    laberinto[1][7].left = false;
    laberinto[1][9].left = false;

    //Fila C
    laberinto[2][1].top = false;
    laberinto[2][2].top = false;
    laberinto[2][3].top = false;
    laberinto[2][4].top = false;
    laberinto[2][6].top = false;
    laberinto[2][8].top = false;
    laberinto[2][1].left = false;
    laberinto[2][2].left = false;
    laberinto[2][3].left = false;
    laberinto[2][4].left = false;
    laberinto[2][4].left = false;
    laberinto[2][8].left = false;

    //Fila D
    laberinto[3][1].top = false;
    laberinto[3][3].top = false;
    laberinto[3][4].top = false;
    laberinto[3][5].top = false;
    laberinto[3][7].top = false;
    laberinto[3][8].top = false;
    laberinto[3][9].top = false;
    laberinto[3][2].left = false;
    laberinto[3][5].left = false;
    laberinto[3][9].left = false;

    //Fila E
    laberinto[4][3].top = false;
    laberinto[4][8].top = false;
    laberinto[4][1].left = false;
    laberinto[4][3].left = false;
    laberinto[4][4].left = false;
    laberinto[4][6].left = false;
    laberinto[4][7].left = false;
    laberinto[4][9].left = false;

    //Fila F
    laberinto[5][0].top = false;
    laberinto[5][2].top = false;
    laberinto[5][3].top = false;
    laberinto[5][4].top = false;
    laberinto[5][7].top = false;
    laberinto[5][9].top = false;
    laberinto[5][1].left = false;
    laberinto[5][2].left = false;
    laberinto[5][3].left = false;
    laberinto[5][4].left = false;
    laberinto[5][5].left = false;
    laberinto[5][6].left = false;
    laberinto[5][7].left = false;
    laberinto[5][9].left = false;

    // Inicio - Final
    laberinto[0][9].esFinal = true;
    laberinto[5][1].esInicio = true;
  }

  bordes();
  printLaberinto();

  // Aqui inicia el laberinto (F, 2)
  if (resolver(5, 1)) {
    print("Resuelto");
  }

  // print("\nCamino correcto: \n[F2][E2][E3][D3][D4][D5][E5][E6][D6][D7[C7][C8][B8][B9][A9][A10]");
}
