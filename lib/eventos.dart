import 'package:flutter/foundation.dart';

import 'evento.dart';

class Eventos extends ChangeNotifier {
  List<Evento> listaEventos;

  Eventos(this.listaEventos);

  void adicionarEvento(Evento novoEvento) {
    listaEventos.add(novoEvento);
    notifyListeners();
  }
}
