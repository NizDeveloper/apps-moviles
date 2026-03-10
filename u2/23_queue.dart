import 'dart:io';

// --- Variables Globales ---
/** * @var queue Representa el espacio físico de la cola (arreglo de tamaño fijo).
 * @var front Índice que apunta al primer elemento de la cola (salida).
 * @var rear Índice que apunta al último elemento de la cola (entrada).
 * @var max Límite máximo de capacidad basado en el índice.
 */
List<num> queue = [0, 0, 0, 0, 0];
int front = -1;
int rear = -1;
int max = 4;

/**
 * @brief Agrega un elemento al final de la cola (Enqueue).
 * @param data Es el dato numérico a agregar.
 */
void enqueue(num data) {
  if (rear < max) {
    // Si la cola está vacía, inicializamos el frente
    if (front == -1) front = 0;
    
    rear++;
    queue[rear] = data;

    stdout.write("Dato encolado: $data -> ");
    printQueue();
  } else {
    print("Overflow (Cola llena)");
  }
}

/**
 * @brief Elimina el primer elemento de la cola (Dequeue).
 */
void dequeue() {
  if (front != -1 && front <= rear) {
    num dataEliminado = queue[front];
    queue[front] = 0; // Limpiamos la posición (opcional en lógica de punteros)
    front++;

    // Reinicio de punteros si la cola queda vacía tras la operación
    if (front > rear) {
      front = -1;
      rear = -1;
    }

    stdout.write("Dequeue ($dataEliminado) -> ");
    printQueue();
  } else {
    print("Underflow (Cola vacía)");
  }
}

/**
 * @brief Imprime el estado actual del arreglo que contiene la cola.
 */
void printQueue() {
  for (int i = 0; i < queue.length; i++) {
    stdout.write("[${queue[i]}] ");
  }
  print("");
}

/**
 * @brief Función principal para probar la lógica de FIFO.
 */
void main() {
  stdout.write("Cola inicial: ");
  printQueue();
  print("-" * 40);

  // --- Operaciones de Inserción ---
  enqueue(10);
  enqueue(20);
  enqueue(30);
  enqueue(40);
  enqueue(50);
  enqueue(60);

  print("-" * 40);

  dequeue();
  dequeue();
  dequeue();
  dequeue();
  dequeue();
  dequeue();
}