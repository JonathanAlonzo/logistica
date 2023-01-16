import 'package:flutter/material.dart';
import 'package:logistica/pantallas/error_404.dart';
import 'package:logistica/pantallas/inventario_fisico.dart';

Widget modulosMenu() {
  return ListView.builder(
    padding: const EdgeInsets.all(10.0),
    itemCount: modulos.length,
    itemBuilder: (context, index) {
      print(modulos[index]['icon']);
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => modulos[index]['link']));
                  },
                  icon: modulos[index]['icon'],
                  label: Text(modulos[index]['nombre']))
            ],
          ),
        ),
      );
    },
  );
}

List modulos = [
  {
    "nombre": "Recepcion de Compras",
    "icon": const Icon(Icons.shopping_bag),
    "link": const Error404()
  },
  {
    "nombre": "Invetario Fisico",
    "icon": const Icon(Icons.add_box),
    "link": const InventarioFisico()
  },
  {
    "nombre": "Inventario Ciclico",
    "icon": const Icon(Icons.download),
    "link": const Error404()
  },
  {
    "nombre": "Surtido de Pedidos",
    "icon": const Icon(Icons.build),
    "link": const Error404()
  },
  {
    "nombre": "Validar Surtido de Pedidos",
    "icon": const Icon(Icons.confirmation_num),
    "link": const Error404()
  },
  {
    "nombre": "Surtido de Odenes de Traspaso",
    "icon": const Icon(Icons.share),
    "link": const Error404()
  },
  {
    "nombre": "Recepción de transitos",
    "icon": const Icon(Icons.gesture),
    "link": const Error404()
  },
];
