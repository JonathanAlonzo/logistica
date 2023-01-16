import 'package:flutter/material.dart';
import 'package:logistica/pantallas/seleccione_almaccen.dart';

class InventarioFisico extends StatefulWidget {
  const InventarioFisico({super.key});

  @override
  State<InventarioFisico> createState() => _InventarioFisicoState();
}

class _InventarioFisicoState extends State<InventarioFisico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventario fisico'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: const Center(
        child: Text('No hay datos para mostrar'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (builder) => const SeleccioneALmacen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
