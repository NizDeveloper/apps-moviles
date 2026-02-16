main(){
  var a = 19;
  final double b;
  const double c = 20;
  a = 20;
  b = 20;
  // c = 20;

  print(a);
  print(b);
  print(c);

  final List<String> personasFinal = ['Juan', 'Pedro', 'Maria'];
  List<String> personasConst = const['Ana', 'Luis', 'Carlos'];

  personasFinal.add('Maria');
  // personasConst.add('Maria');

  print(personasFinal);
  print(personasConst);

}
