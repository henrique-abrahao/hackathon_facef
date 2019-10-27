class User {
  int id;
  String codigo;
  String nome;
  bool professor;
  bool ativo;


  User();

  User.fromMap(Map map) {
     id = map['data']['id'];
     codigo = map['data']['codigo'];
     nome = map['data']['nome'];
     professor = map['data']['professor'];
     ativo = map['data']['ativo'];

  }

  @override
  String toString() {
    return "User(id: $id, nome:$nome, codigo: $codigo, professor: $professor, ativo: $ativo)";
  }
}