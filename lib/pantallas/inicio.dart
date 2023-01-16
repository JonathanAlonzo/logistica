import 'package:flutter/material.dart';

import './../componentes/menu_lateral.dart';
import './../componentes/modulos_inicio.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: modulosMenu(),
      drawer: menuLateral(context),
    );
  }
}
