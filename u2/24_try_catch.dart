import 'dart:io';

main(){
  int n = 0, f = 1;
  
  try{
    stdout.writeln('Ingrese un número para calcular su factorial: ');
    n = int.parse(stdin.readLineSync()!);

    if (n < 0) {
      throw RangeError('Numero negativo');
    }

    for(int c = n; c > 1; c--) {
      f = f * c; 
    }  
    
    stdout.writeln('El factorial de $n es: $f');
  } on RangeError{
    print('Los factoriales negativos se calculan diferente');
  } catch(e){
    print('An unkonwn exception ocurred: $e');
  }
}