import 'package:flutter/material.dart';

class Teladois extends StatefulWidget {
  const Teladois({super.key, required this.title});

  final String title;

  @override
  State<Teladois> createState() => _TeladoisState();
}

_voltar(BuildContext context){
  Navigator.pop(context);
}

class _TeladoisState extends State<Teladois> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _voltar(context),
          child: Container(
            height: 150,
            width: 150,
            color: Colors.red,
          ),
        )
      ),
    );
  }
}
