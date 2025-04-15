import 'package:flutter/foundation.dart';

import 'evento.dart';

class Eventos extends ChangeNotifier {
  List<Evento> listaEventos;

  Eventos(this.listaEventos);
}
