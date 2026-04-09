import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frases/models/usuario.dart';
import 'package:http/http.dart' as http;

class Teladois extends StatefulWidget {
  const Teladois({super.key});

  @override
  State<Teladois> createState() => _TeladoisState();
}

var nomeRetornado = '';
var zipcode = '';

_voltar(BuildContext context) {
  Navigator.pop(context);
}

class _TeladoisState extends State<Teladois> {
  List lista = [];
  var usuarioFormatado = [];
  TextEditingController texto = new TextEditingController();

  Future<List<dynamic>> _chamarAPI() async {
    Random random = new Random();
     await Future.delayed(Duration(seconds: 2));
    var resposta = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),

    );
    lista = jsonDecode(resposta.body) as List;
    usuarioFormatado = lista.map((item) => Usuario.fromJson(item)).toList();
    return usuarioFormatado;
  }

  // void _chamarAPI() async {
  //   var retorno = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  //   if(retorno.statusCode == 200){
  //     lista = jsonDecode(retorno.body) as List;
  //     var usuario = lista[int.parse(texto.text)] as Map;
  //     setState(() {
  //       nomeRetornado = usuario['name'];
  //     });
  //   }
  // }


  // void _chamarAPI() async {
  //   var retorno = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  //   if(retorno.statusCode == 200){
  //     lista = jsonDecode(retorno.body) as List;
  //     Usuario usuario = Usuario.fromJson(lista[int.parse(texto.text)]);
  //     setState(() {
  //       nomeRetornado = usuario.nome;
  //     });
  //   }
  // }


  @override
  void initState() {
    super.initState();
  }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('diajsdijasidj')),
//       body: Center(
//         child: Column(
//           children: [
//             TextField(
//               controller: texto,
//               decoration: InputDecoration(
//                 hint: Text('Selecione o usuário'),
//               ),
//             ),
//             Text(nomeRetornado, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
//             ElevatedButton(onPressed: _chamarAPI, child: Text('Chama API'))
//           ],
//         ),
//       )
//     );
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('diajsdijasidj')),
//         body: Center(
//           child: Column(
//             children: [
//               TextField(
//                 controller: texto,
//                 decoration: InputDecoration(
//                   hint: Text('Selecione o usuário'),
//                 ),
//               ),
//               Text(nomeRetornado, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
//               ElevatedButton(onPressed: _chamarAPI, child: Text('Chama API'))
//             ],
//           ),
//         )
//     );
//   }
// }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('diajsdijasidj')),
      body: FutureBuilder(
        future: _chamarAPI(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final usuarios = snapshot.data!;
            return ListView.builder(
              itemCount: usuarioFormatado.length,
              itemBuilder: (context, index) {
                final user = usuarioFormatado[index];
                return Padding(padding: .only(bottom: 5, left: 5),
                    child: GestureDetector(
                  onTap: ()=>{
                    print(index)
                  },
                  child: Row(
                    children: [
                      Image.network('https://i.scdn.co/image/ab6761610000e5ebc823d2064109bbee668284b0', height: 100, width: 100,),
                      Column(
                        children: [
                          Container(child: Text(user.nome), color: Colors.red,),
                          Container(child: Text(user.zipcode)),
                        ],
                      )
                    ],
                  ),
                ));
              },
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}