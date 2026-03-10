import 'dart:io';

/**
 * @brief Representa un ticket de soporte técnico.
 * @param id Identificador único del ticket.
 * @param description Descripción breve del problema reportado.
 */
class Ticket {
  int id;
  String description;
  Ticket({required this.id, required this.description});
}

// --- Estructuras de Datos ---
List<Ticket> colaTickets = [];
List<String> pilaAcciones = [];

/** @var contadorId Contador global para asignar IDs únicos y autoincrementables. */
int contadorId = 1;


/**
 * @brief Solicita datos al usuario para crear un ticket y lo añade al final de la cola.
 */
void registrarTicket() {
  stdout.write('Ingrese la descripción del problema: ');
  String description = stdin.readLineSync() ?? "Sin descripción";
  
  // Encolar: Se agrega al final de la lista
  colaTickets.add(Ticket(id: contadorId++, description: description));
  print('Ticket registrado con éxito\n');
}


/**
 * @brief Extrae y muestra el primer ticket en la cola (el más antiguo).
 */
void atenderTicket() {
  if (colaTickets.isNotEmpty) {
    // Desencolar: Se elimina el elemento en el índice 0
    Ticket atendido = colaTickets.removeAt(0);
    print('Atendiendo Ticket #${atendido.id}: ${atendido.description}');
  } else {
    print('No hay tickets en la cola');
  }
}


/**
 * @brief Registra una acción técnica y la apila en el historial.
 */
void registrarAccionTecnico() {
  stdout.write('Ingrese la acción realizada: ');
  String? accion = stdin.readLineSync();
  
  if (accion != null && accion.isNotEmpty) {
    // Apilar: Se añade al final de la lista (cima de la pila)
    pilaAcciones.add(accion);
    print('Acción registrada.');
  }
}


/**
 * @brief Elimina la última acción registrada (operación Pop de la pila).
 */
void deshacerUltimaAccion() {
  if (pilaAcciones.isNotEmpty) {
    // Desapilar: Se elimina el último elemento añadido
    String eliminada = pilaAcciones.removeLast();
    print('Se deshizo la acción: "$eliminada"');
  } else {
    print('No hay acciones para deshacer.');
  }
}


/**
 * @brief Imprime el listado actual de tickets pendientes y el historial de acciones.
 */
void mostrarEstadoSistema() {
  print('\n--- ESTADO DEL SISTEMA ---');
  print('Tickets en cola: ${colaTickets.length}');
  for (var t in colaTickets) {
    print('  [#${t.id}] ${t.description}');
  }
  
  print('Historial de acciones (Pila):');
  // Se recorre en orden inverso para mostrar la acción más reciente primero
  for (var a in pilaAcciones.reversed) {
    print('  - $a');
  }
  print('--------------------------');
}


/**
 * @brief Punto de entrada principal. Gestiona el bucle del menú de usuario.
 */
void main() {
  bool ejecutar = true;

  while (ejecutar) {
    print('''
    1. Agregar ticket
    2. Atender ticket
    3. Registrar acción del técnico
    4. Deshacer última acción
    5. Mostrar estado del sistema
    6. Salir''');
    
    stdout.write('Seleccione una opción: ');
    String? entrada = stdin.readLineSync();
    
    switch (entrada) {
      case '1': 
        registrarTicket(); 
        break;
        
      case '2': 
        atenderTicket(); 
        break;
        
      case '3': 
        registrarAccionTecnico(); 
        break;
        
      case '4': 
        deshacerUltimaAccion(); 
        break;
        
      case '5': 
        mostrarEstadoSistema(); 
        break;
        
      case '6': 
        ejecutar = false; 
        break;
        
      default: 
        print('Opción no válida.');
    }
  }
}