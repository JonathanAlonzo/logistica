import 'package:flutter/material.dart';

import '../pantallas/inicio_sesion.dart';

Widget menuLateral(context) {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
            decoration: const BoxDecoration(color: Colors.blueAccent),
            child: Column(
              children: const [
                Expanded(
                    child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/img.jpeg'))),
                Text(
                  'Nombre',
                  style: TextStyle(color: Colors.white),
                )
              ],
            )),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('Información',
                  style: TextStyle(color: Colors.black54)),
              TextButton.icon(
                  onPressed: () {
                    //CODE GOES HERE
                  },
                  icon: const Icon(
                    Icons.person,
                    color: Colors.black54,
                  ),
                  label: const Text('Usuario',
                      style: TextStyle(color: Colors.black87))),
              TextButton.icon(
                  onPressed: () {
                    //CODE GOES HERE
                  },
                  icon: const Icon(
                    Icons.app_settings_alt,
                    color: Colors.black54,
                  ),
                  label: const Text('App',
                      style: TextStyle(color: Colors.black87))),
              const Divider(),
              const Text('Otros', style: TextStyle(color: Colors.black54)),
              TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => InicioSesion()));
                  },
                  icon: const Icon(
                    Icons.logout_outlined,
                    color: Colors.black54,
                  ),
                  label: const Text('Cerrar sesión',
                      style: TextStyle(color: Colors.black87)))
            ],
          ),
        )
      ],
    ),
  );
}
