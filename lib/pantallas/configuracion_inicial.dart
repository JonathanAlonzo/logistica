import 'package:flutter/material.dart';
import 'package:logistica/pantallas/inicio.dart';

class ConfiguracionInical extends StatefulWidget {
  ConfiguracionInical({super.key});

  @override
  State<ConfiguracionInical> createState() => _ConfiguracionInicalState();
}

class _ConfiguracionInicalState extends State<ConfiguracionInical> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(_inicio());
            },
            icon: const Icon(Icons.check),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.link),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Api URL',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Configure la dirección de la api',
                          style: TextStyle(color: Colors.black54),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.4,
                          child: const TextField(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.qr_code_2),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Escaner',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Usa la camara para leer codigo',
                          style: TextStyle(color: Colors.black54),
                        ),
                        Row(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width / 1.8,
                                child: const Text(
                                  '.',
                                  style: TextStyle(color: Colors.white),
                                )),
                            Container(
                              child: Switch(
                                value: light,
                                onChanged: (bool value) {
                                  setState(() {
                                    light = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Route _inicio() {
    return PageRouteBuilder(
      transitionDuration: const Duration(seconds: 1),
      pageBuilder: (context, animation, secondaryAnimation) => const Inicio(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
