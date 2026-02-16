import 'dart:io';

main(){
  int r = 0;
  outterCycle:
  for(int j = 0; j < 10; j++){
    // if(j == 2){
    //   break;
    // }
    stdout.writeln('El valor de J es: $j ');
    for(int i = 0; i < 10; i++){
      r = i % 2;
      if(r == 1){
        break outterCycle;
        // continue;
      }
      stdout.writeln('El valor de I es: $i');
    }
  }
  print('Ya se salio del for');
}
