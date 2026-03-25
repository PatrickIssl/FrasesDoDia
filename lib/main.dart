import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frases/teladois.dart';

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
      initialRoute: '/',
      routes: {
        "/": (context) => MyHomePage(title: ''),
        "/tela-dois": (context) => Teladois(),
      },
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
  final _textoNome = new TextEditingController();
  String erro = '';
  DateTime? data;

  mostrarData() async {
    DateTime? newdata = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    setState(() {
      data = newdata;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .spaceAround,
          children: [
            Container(
              width: 300,
              child: TextField(
                keyboardType: .emailAddress,
                controller: _textoNome,
                decoration: InputDecoration(
                  error: Text(erro),
                  label: Text('Nome'),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              width: 300,
              child: TextField(
                keyboardType: .emailAddress,
                decoration: InputDecoration(
                  error: Text(erro),
                  label: Text('Nome'),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Text('${data?.day}/${data?.month}/${data?.year}'),
            DropdownButton(
              items: ['teste', 'teste2']
                  .map((String valor) {
                return DropdownMenuItem<String>(
                  value: valor,
                  child: Text(valor),
                );
              }).toList(),
              onChanged: (valor) => {},
            ),
            ElevatedButton(
              onPressed: () => {
                if (_textoNome.text.isEmpty)
                  {
                    setState(() {
                      erro = 'Falta o nome';
                    }),
                    mostrarData(),
                  },
              },
              child: Text('Printar valor'),
            ),
          ],
        ),
      ),
    );
  }
}
