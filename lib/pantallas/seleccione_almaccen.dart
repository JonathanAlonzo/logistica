import 'package:flutter/material.dart';

class SeleccioneALmacen extends StatelessWidget {
  const SeleccioneALmacen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccione Almacen'),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.blueAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sucursal: ',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: DropdownButtonFormField(
                    onChanged: (value) {
                      //
                    },
                    items: dropdownItems,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('(Transito)'),
                    Text(
                      'En transito',
                      style: TextStyle(color: Colors.black26),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Matriz"), value: "Matriz"),
      DropdownMenuItem(child: Text("Sucursal 1"), value: "Sucursal 1"),
      DropdownMenuItem(child: Text("Sucursal 2"), value: "Sucursal 2"),
      DropdownMenuItem(child: Text("Scursal 3"), value: "Sucursal 3"),
    ];
    return menuItems;
  }
}
