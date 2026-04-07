class Usuario {

  final String nome;
  final String zipcode;

  Usuario(this.nome, this.zipcode);

  factory Usuario.fromJson(Map json){
    return Usuario(json['name'], json['address']['zipcode']);
  }

}