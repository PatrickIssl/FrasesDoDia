import 'package:flutter/material.dart';

class Teladois extends StatefulWidget {
  const Teladois({super.key});


  @override
  State<Teladois> createState() => _TeladoisState();
}

_voltar(BuildContext context){
  Navigator.pop(context);
}

class _TeladoisState extends State<Teladois> {
  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments  as Map<String, String>?;;

    return Scaffold(
      appBar: AppBar(
        title: Text(args!['title']!),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _voltar(context),
          child: Container(
            height: 150,
            width: 150,
            color: Colors.red,
            child: Text(args['jogada']!, style: TextStyle(fontSize: 150),),
          ),
        )
      ),
    );
  }
}
