import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool trocarCor = true;
  var corNova = Color.fromRGBO(0, 255, 0, 1);

  void alterarCor(){
    setState(() {
      trocarCor = !trocarCor;
      if(trocarCor){
        corNova = Color.fromRGBO(0, 255, 0, 1);
      }else{
        corNova = Color.fromRGBO(255, 0, 0, 1);
      }
    });
  }

  alterarCorAleatoria(){
    Random random = new Random();
    setState(() {
      corNova = Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
       GestureDetector(
         onTap: alterarCor,
         onDoubleTap: alterarCorAleatoria,
         child:  Container(
           width: 150,
           height: 150,
           color: corNova,
         ),

       )
      ),
    );
  }
}
