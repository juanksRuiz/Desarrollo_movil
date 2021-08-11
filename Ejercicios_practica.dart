import 'dart:io';

// EJERCICIO 1
/* Create a program that asks the user to enter their name and their age.
Print out a message that tells how many years they have to be 100 years old. */

void main(){
  //ejercicio_1();
  //ejercicio_2();
  //print(ejercicio_3([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]));
  //ejercicio_4();
  print(ejercicio_5([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89], [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]));
}

// ------------------- Funciones para cada ejercicio -------------------------------
void ejercicio_1(){
    print("Ingresa tu nombre:");
    String? nombre = stdin.readLineSync(); // ? es para especificar que la variable puede ser null
    print("Hola, $nombre. ¡Mucho gusto!");
    
    print("Cuantos años tienes?");
    int? edad = int.parse(stdin.readLineSync()!);
    print("Bueno, te faltan "+ (100 -edad).toString()+" para llegar a 100 años");
}

void ejercicio_2(){
    print("Ingrese un numero entero.");
    int? n = int.parse(stdin.readLineSync()!);
    if (n % 2== 0){
      print("El numero es par");
    }else{
      print("El numero es impar");
    }
}

List<int> ejercicio_3(List<int> mi_lista){
  List<int> lista_final = [];
  for(int i in mi_lista){
    if (i< 5){
      lista_final.add(i);
    }
  }
  return lista_final;  
}

void ejercicio_4(){
  print("Ingrese un numero:");
  int? n = int.parse(stdin.readLineSync()!);
  print("$n es divisible por los siguientes enteros positivos:");
  for(var i = 1; i <= n; i++){
    if(n % i==0){
      print(i);
    }
  }
}

List<int> ejercicio_5(List<int> a, List<int> b){
  Set<int> set_a = a.toSet();
  Set<int> set_b = b.toSet();
  Set <int> intersection = set_a.intersection(set_b);
  List<int> lista = [];
  for(var e in intersection){
    lista.add(e);
  }
  return lista;
}