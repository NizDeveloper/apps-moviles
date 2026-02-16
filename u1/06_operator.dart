main(){
  // Assignment operators
  int a = 10;
  int? b;
  b ??=20;
  print(a); // Output: 20

  // Conditional Operators
  int c = (a > b) ? a : b;
  print(c); // output: 20

  int d = 23;
  String response = (d > 25) ? 'd is greater than 25' : 'd is not greater than 25';
  print(response); // Output: d is not greater than 25
}
