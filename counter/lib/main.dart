// Importaciones
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const Counter());
}

// Contructor de una clase coounter
class Counter extends StatefulWidget {
  //Clave del contructor
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int cnt = 0;
  //Se crea metodo build y devuelve un w
  @override
  Widget build(BuildContext context) {
    //Widget principal
    return MaterialApp(
      //Se pasan parametros nombrados
      title: 'Contador',
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Contador de Números"),
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Contemos Números",
                  style: TextStyle(fontSize: 25, color: Colors.purple)),
              Text("$cnt",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple))
            ],
          )),
          floatingActionButton:
          //Encerar en un Row
           FloatingActionButton(
            onPressed: () {
              setState(() {
                ++cnt;
              });
              print(cnt);
            },
            child: const Icon(Icons.add),
          )),
      //Se le coloca cons al padre
    ); //Center necesita Un Hijo
  }
}
