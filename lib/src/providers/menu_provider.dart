import 'dart:convert';

import 'package:flutter/services.dart';

class MenuProvider {
  List<dynamic> opciones = [];

  MenuProvider() {
    cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(resp);
    opciones = dataMap['rutas'];
    return opciones;
  }
}

final menuProvider = MenuProvider();
