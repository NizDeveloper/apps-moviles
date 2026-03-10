import 'dart:io';

// --- Variables Globales ---
//                 0  1  2  3  4
List<num> stack = [0, 0, 0, 0, 0];
int top = -1;
int max = 4;

/*
* @brief Agrega un elemento al final de la pila
* @param Es el dato a agregar
*/
void push(data) {
  if (top != max) {
    top++;
    stack[top] = data;

    stdout.write("Dato agregado: $data -> ");
    printStack();
  } else {
    print("Overflow");
  }
}

/*
* @brief Borra el ultimo elemento de la pila
*/
void pop() {
  if (top >= 0) {
    stack[top] = 0;
    top--;

    stdout.write("Pop -> ");
    printStack();
  } else {
    print("Empty");
  }
}

/*
* @brief Imprime la pila
*/
void printStack() {
  for (int i = 0; i != stack.length; i++) {
    stdout.write("[${stack[i]}] ");
  }
  print("");
}

main() {
  stdout.write("Stack principal: ");
  for (int i = 0; i != stack.length; i++) {
    stdout.write("[${stack[i]}] ");
  }
  print("\n" + "--------" * 5);

  push(1);
  push(2);
  push(3);
  push(4);
  push(5);
  push(6);

  pop();
  pop();
  pop();
  pop();
  pop();
  pop();
}
