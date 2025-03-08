import 'package:aprendendo_gerenciamento_estados/Usuarios/usuario.dart';
import 'package:flutter/material.dart';

class Usuarios extends ChangeNotifier{
  static List<Usuario> listaUsuarios = [];

  static void adicinarUsuario() {}

  static void removerUsuario() {}

  static List<Usuario> get retornaUsuarios {
    return listaUsuarios;
  }
}
